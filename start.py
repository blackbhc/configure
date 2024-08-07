import numpy as np
import scipy as sp
import astropy as ap
import h5py
from scipy.stats import binned_statistic_2d as bin2d
from scipy.stats import binned_statistic as bin1d
from matplotlib import pyplot as plt
import matplotlib as mpl
import imageio
import astropy.coordinates
from scipy.stats import binned_statistic_2d as bin2d
from scipy.stats import binned_statistic as bin1d
from scipy.ndimage import zoom
from scipy.stats import linregress
import warnings
from functools import reduce

plt.rcParams.update(
    {
        "font.family": "Times New Roman",
        "font.size": 26,
        "mathtext.fontset": "cm",
    }
)
