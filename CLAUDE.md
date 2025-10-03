# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Computer Vision learning repository based on "Mastering Computer Vision with PyTorch 2.0" by Orange AVA. The repository contains code examples organized by book chapters, focusing on PyTorch 2.0 features and computer vision techniques.

## Environment Setup

### Creating the Environment

Use the provided script to create and configure the virtual environment:

```bash
./create_env.sh
```

This script:
- Creates a virtual environment named `pytorch_env`
- Installs PyTorch (CPU version by default)
- Installs all dependencies from [requirements.txt](requirements.txt)

### Activating the Environment

```bash
source pytorch_env/bin/activate
```

### Manual Installation

If you need to install PyTorch with CUDA support:

```bash
# For CUDA 11.8
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
```

Then install remaining dependencies:

```bash
pip install -r requirements.txt
```

## Repository Structure

### Chapter Organization

Code examples are organized in [cv_book/](cv_book/) with each chapter in a separate directory:
- **Chapter 1**: PyTorch fundamentals, dynamic graphs, autograd, GPU acceleration, TorchScript
- **Chapter 3**: PyTorch 2.0 features, `torch.compile`, migration from 1.x to 2.0
- **Chapter 6**: Data augmentation techniques using torchvision transforms, CIFAR-10 training
- **Chapter 12**: Model optimization (quantization, pruning) for deployment

### Key Dependencies

- **PyTorch ecosystem**: torch, torchvision, torchaudio (≥2.0.0)
- **Computer Vision**: opencv-python, pillow, scikit-image, albumentations
- **ML/Data**: numpy, pandas, scikit-learn, scipy
- **Visualization**: matplotlib, seaborn, plotly
- **Development**: jupyter, ipykernel, ipywidgets
- **Model utilities**: timm, torchmetrics

## Architecture and Key Concepts

### PyTorch 2.0 Features

This repository emphasizes PyTorch 2.0 capabilities:

1. **torch.compile**: Use `torch.compile(model)` to optimize models with the Inductor backend
2. **Simplified super()**: New style uses `super().__init__()` instead of `super(ClassName, self).__init__()`
3. **Performance optimization**: Models are compiled for better inference and training speed

### Common Patterns

#### Model Compilation

```python
import torch

# Define model
model = MyModel()

# Compile for optimization
compiled_model = torch.compile(model)
```

#### GPU Device Selection

```python
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
x = torch.ones([3, 3], device=device)
```

#### Data Augmentation Pipeline

```python
from torchvision import transforms

transform_pipeline = transforms.Compose([
    transforms.RandomCrop(32, padding=4),
    transforms.RandomHorizontalFlip(),
    transforms.ColorJitter(brightness=0.1, contrast=0.1),
    transforms.ToTensor(),
    transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5)),
])
```

## Running Code

### Jupyter Notebooks

Start Jupyter to run the examples:

```bash
jupyter notebook
```

The repository includes a [test.ipynb](test.ipynb) notebook for experimentation.

### Running Chapter Examples

Chapter files are Python scripts that can be executed directly:

```bash
python "cv_book/Chapter 01/chapter_1.py"
```

Note: Some chapter files contain Google Colab-specific commands (`!pip install`, `!source`) that won't work in local environments. These should be skipped or adapted when running locally.

## Development Notes

### Working with Chapter Files

- Chapter files are converted from Google Colab notebooks
- They contain inline pip install commands (comment these out when running locally with the configured environment)
- Examples are self-contained and demonstrate specific concepts from each chapter
- Some examples require external image files (e.g., "example.jpg" in Chapter 3)

### Model Training

When training models:
- Use `torch.compile()` for better performance in PyTorch 2.0
- Check for GPU availability: `torch.cuda.is_available()`
- Models, datasets, and checkpoints are gitignored (see [.gitignore](.gitignore))

### Data Management

The [.gitignore](.gitignore) excludes:
- Model weights (*.pth, *.pt, *.pkl, *.h5, *.onnx)
- Datasets and images (data/, datasets/, images/, *.jpg, *.png, etc.)
- Experiment tracking (wandb/, mlruns/, logs/, runs/)
- Checkpoints and saved models

Keep large files and datasets outside the repository or use external storage.
