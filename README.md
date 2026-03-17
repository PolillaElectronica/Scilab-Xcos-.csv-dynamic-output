# 📊 Dynamic CSV Reader Block for Scilab/Xcos

![Scilab](https://img.shields.io/badge/Scilab-6.1+-red.svg)
![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)
![Research](https://img.shields.io/badge/Status-Stable-green.svg)

A custom Xcos interface block that dynamically adapts its number of output ports based on the columns found in a selected `.csv` file. This eliminates the need to manually configure block outputs for different datasets.

---

## 📖 Project Overview
In this repository, we define the structure of an Xcos block that allows the user to select a `.csv` file. The block automatically reconfigures its output ports (Total columns minus one) to match the data structure.

## 🚀 Installation & Setup Guide

To use this block in your Xcos simulations, follow these steps:

<details>
  <summary><b>1. Load the Interface Function ⬇️</b></summary>

Before opening Xcos, you need to register the new block in Scilab:
1. Open **Scilab**.
2. Navigate to the folder where you downloaded `lector_csv_2.sci`.
3. Execute the following command in the Scilab console:
   ```scilab
   exec('lector_csv_2.sci');
</details>

<details>
<summary><b>2. Add the Block to Xcos Palette ⬇️</b></summary>

To make the block available in the Xcos GUI, run these commands in the console:

pal = xcosPal("My CSV Blocks");
pal = xcosPalAddBlock(pal, "lector_csv_2");
xcosPalAdd(pal, "My CSV Blocks");


</details>

<details>
<summary><b>3. Configuration & Usage ⬇️</b></summary>

    Open Xcos and drag your new block into the diagram.

    Double-click the block to open the file selector.

    Select your .csv file.

    The block will automatically reconfigure its output ports.

    [!IMPORTANT]

    Ensure your CSV file uses commas (,) as delimiters.

</details>

📊 Technical Specifications
Feature	Description
Logic	Interface function adapts ports dynamically
File Format	Standard .csv (Comma separated)
Compatibility	Tested on Scilab 6.1+ / 2024.0
Output Rule	Noutputs​=Total Columns−1
📜 License

This project is licensed under the Apache License 2.0.
🎓 Citation

If you use this block in your research or engineering projects, please cite it as:

    Cánovas Martín, Iván (2026). Dynamic CSV Reader Block for Scilab/Xcos. GitHub Repository.

Developed by Iván Cánovas Martín


---

### How to apply this:
1. Open your `README.md` on GitHub.
2. Click the **pencil icon** (edit).
3. Delete everything and paste the code above.
4. **Save changes.** ### Why this works:
* **The "Summary" tags:** Your technical instructions from `INSTRUCTIONS.md` are now tucked away in neat dropdowns so they don't clutter the page.
* **Badges:** The red/blue tags at the top make it look like an official Scilab extension.
* **Code highlighting:** I used ` ```scilab ` so the code you wrote in your instructions looks clean and colored.

Would you like me to help you create a specific **social preview image** (the image that appears when you share your link on LinkedIn or Reddit)?
