!!! Note Introduction to notebook

    A notebook integrates code and its output into a single document that combines visualizations, narrative text, mathematical equations, and other rich media

### Installation

```bash
pip install jupyter
```

Or simply use the [Anaconda](https://www.anaconda.com/) distribution

### Ipynb

each .ipynb file is one notebook, each .ipynb file is a text file that describes the contents of your notebook in a format called JSON.

### Shortcut

Ctrl+shift+P to open command palette

- kernel is a program that runs and introspects the user’s code.
- cell is a container for text to be displayed in the notebook or code to be executed by the notebook's kernel

  - code cell is a cell where you can write and execute code
  - markdown cell is a cell where you can write text using the markdown language

ctrl+enter to run the cell

Toggle between edit and command mode with Esc and Enter, respectively.
Once in command mode:
Scroll up and down your cells with your Up and Down keys.
Press A or B to insert a new cell above or below the active cell.
M will transform the active cell to a Markdown cell.
Y will set the active cell to a code cell.
D + D (D twice) will delete the active cell.
Z will undo cell deletion.
Hold Shift and press Up or Down to select multiple cells at once. With multiple cells selected, Shift + M will merge your selection.
Ctrl + Shift + -, in edit mode, will split the active cell at the cursor.
You can also click and Shift + Click in the margin to the left of your cells to select them.

### Kernel

- when you run a code cell, that code is executed within the kernel
- the kernel's state persists over time and between cells - it pertains to the document as a whole and not individual cells

### Restart

- Restart: restarts the kernel, thus clearing all the variables etc that were defined.
- Restart & Clear Output: same as above but will also wipe the output displayed below your code cells.
- Restart & Run All: same as above but will also run all your cells in order from first to last.

### Setup

```bash
%matplotlib inline
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns sns.set(style="darkgrid")
```

That first line isn’t a Python command, but uses something called a line magic to instruct Jupyter to capture Matplotlib plots and render them in the cell output.
**You can revert to the checkpoint from the menu via “File > Revert to Checkpoint.”**

### Sharing

1. Click “Cell > All Output > Clear” 2. Click “Kernel > Restart & Run All” 3. Wait for your code cells to finish executing and check ran as expected

### Exporting your notebooks

Jupyter has built-in support for exporting to HTML and PDF as well as several other formats, which you can find from the menu under “File > Download As.”
