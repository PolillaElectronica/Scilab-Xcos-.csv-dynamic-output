function [x, y, typ] = lector_csv_2(job, arg1, arg2)
    x = []; y = []; typ = [];
    
    select job
    case 'set' then
        x = arg1;
        graphics = arg1.graphics;
        exprs = graphics.exprs;
        model = arg1.model;
        
        while %t do
            ruta = uigetfile("*.csv", "/home/polilla/Escritorio/", "Selecciona el CSV de datos");
            if ruta == "" then break; end 
            
            fd = mopen(ruta, 'r');
            if fd == -1 then
                message("Error: No se pudo abrir el archivo para analizarlo.");
                break;
            end
            
            linea = mgetl(fd, 1);
            mclose(fd);
            
            elementos = strsplit(linea, ',');
            n_cols = size(elementos, '*');
            n_salidas = n_cols - 1; 
            
            // EL TRUCO: Convertimos el texto en números ASCII
            ascii_ruta = ascii(ruta);
            len_ruta = size(ascii_ruta, '*');
            
            model.out = ones(n_salidas, 1);
            model.opar = list(); // Ya no pasamos texto por opar
            
            // Metemos todo en una matriz de números maciza: [Columnas, LongitudTexto, Letra1, Letra2...]
            model.ipar = [n_cols; len_ruta; ascii_ruta(:)]; 
            
            exprs = [ruta];
            graphics.exprs = exprs;
            x.graphics = graphics;
            x.model = model;
            break;
        end
        
    case 'define' then
        ruta_defecto = '/home/polilla/Escritorio/PM5110_TRAFO_24h.csv';
        n_cols_defecto = 2; 
        n_salidas = n_cols_defecto - 1;
        
        // Ciframos también la ruta por defecto para que Xcos no dé error al cargar la Paleta
        ascii_ruta = ascii(ruta_defecto);
        len_ruta = size(ascii_ruta, '*');
        
        model = scicos_model();
        model.sim = list('lector_csv_c_2', 4);
        model.in = [];
        model.out = ones(n_salidas, 1);
        model.evtin = 1; // El reloj se queda, es vital para el tiempo discreto
        model.evtout = [];
        model.opar = list(); 
        model.ipar = [n_cols_defecto; len_ruta; ascii_ruta(:)];
        model.blocktype = 'd';
        model.dep_ut = [%f, %f];
        
        exprs = [ruta_defecto];
        gr_i = [];
        x = standard_define([3 2], model, exprs, gr_i);
        x.graphics.style = ["blockWithLabel;displayedLabel=""Lector CSV 2"""];
    end
endfunction
