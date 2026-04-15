# Reproducible Data Science Project Directory Template

This repository contains a template for reproducible data science
projects running on Bash+Perl, Python 3, and R.

It has been released under the GPL 3.0 license to be cloned
by students of the Data Science and Computing (DSC) 011: Computing and
Statistical Programming course. 

## Version

This is a mofidication of version 0.1 released April, 2025.

## Dependencies

1. This project has been developed for practice working on 
Linux/UNIX-like systems such as Mac or Ubuntu Linux under WSL2. 

2. End-to-end automation is achieved through Bash+Perl scripts

3. Command-line Python is used to convert HTML files to text with the library
`html2text` installed automatically when you run `uv sync`

4. Python dependencies are managed with
[`uv`](https://github.com/astral-sh/uv).
First, if you don't already have it, install `uv` with:

```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Then, set up the project directory (make data directories and initialize python and locally install html2text python package) by running:

```
bash scripts/00-setup.sh
```

5. Obtain data by running:

```
bash scripts/01-obtain.sh
```

6. Start the process of processing and cleaning the data by running:

```
bash scripts/02-scrub.sh
```

7. Open the RStudio project contained in this project directory in your Linux RStudi Server on WSL2 or RStudio Desktop on Mac.

8. Navigate to the Files pane to open the Demo Notebook for today.

9. Personalize and save your copy of today's Demo Notebook **in the same project directory that you just cloned from github where you opened the template, under `~/DSC-011-Sp26/`.**

10. Work the notebook following the instructions and the instructor's demonstrations.

## Baby Names: the Original Content and Purpose of this Template Repository

The original contents of this repository provide the starting point
for a successively developed data science project on U.S. Babynames
data from the [decade view of the U.S. Social Security Administration
(S.S.A.). portal on baby names](https://www.ssa.gov/oact/babynames/decades/) As of April
2025, the S.S.A. continues to serve data on the top 200 ranked boy's
and girl's names over 14 decades of census data. 

Following the [OSEMN Data Science Life
Cycle](https://www.datascience-pm.com/osemn/), the initial template
repository provides Bash scripts to obtain the raw data from the U.S.
S.S.A. website, Bash+Perl and Python scripts to scrub the data.  

Future tasks intended for students include providing R code to generate summary
data objects and to generate plots from them. 

### Quick Start with Baby Names

1. From inside your cloned local repository, obtain the raw data by
running:

```
bash scripts/01-obtain.sh
```

This command will download HTML files from the U.S.
S.S.A. to the directory `data/raw`.

2. Clean and process and the raw data to directory `data/processed` by running the script 

```
bash scripts/02-scrub.sh
```

## About README Files in General

According to [How to organize your Python data science
project](https://gist.github.com/ericmjl/27e50331f24db3e8f957d1fe7bbbe510),
a README file should contain "information that will
help your forgetful future self, newcomers, and collaborators figure
out why this project exists, how things are organized, conventions
used in the project, and where they can go to find more information.

Note here that the why portion is the most important. It gives the
necessary context for the reader of your README file. Think of it as
documentation that you leave behind, so you don’t have to sit down and
explain over and over the high-level overview of the project."

This Readme file has been written in Markdown.
