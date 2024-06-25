from setuptools import setup, find_packages

setup (
    name='DevFetch',
    version='1.0.0',
    author='Gianluca Langhans',
    license='MIT License',
    description='google search automation for devs',
    url='https://github.com/lmaotrix/DevFetch',
    packages=find_packages(),
    python_requires='>=3.10',
    entry_points={
        'console_scripts': [
            's=DevFetch.script:main',
        ],
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent"
    ]
)