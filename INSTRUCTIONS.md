To use this block in your Xcos simulations, follow these steps:
1. Load the Interface Function

Before opening Xcos, you need to tell Scilab about this new block.

    Open Scilab.

    Navigate to the folder where you downloaded lector_csv_2.sci.

    Execute the following command in the Scilab console:
    exec('lector_csv_2.sci');
    

2. Add the Block to Xcos

    pal = xcosPal("Mis Bloques CSV");
    pal = xcosPalAddBlock(pal, "lector_csv_2");
    xcosPalAdd(pal, "Mis Bloques CSV");
    
    
3. Configuration

    Double-click the block to open the file selector.

    Select your .csv file.

    The block will automatically reconfigure its output ports (Total columns minus one).

    Note: Ensure your CSV uses commas (,) as delimiters.z
