import numpy as np
import h5py
from matplotlib import pyplot as plt
import matplotlib as mpl
from matplotlib.ticker import MultipleLocator, AutoMinorLocator
import imageio
import scipy as sp
from scipy.stats import binned_statistic_2d as bin2d
from scipy.stats import binned_statistic as bin1d
from scipy.stats import linregress
from scipy.interpolate import UnivariateSpline
from scipy.interpolate import interp1d
from scipy.optimize import curve_fit
import astropy as ap
import astropy.coordinates
from astropy import units as u
from astropy import constants as const
import warnings
from functools import reduce
from tqdm import tqdm

plt.rcParams.update(
    {
        "font.family": "Times New Roman",
        "font.size": 26,
        "mathtext.fontset": "cm",
    }
)
