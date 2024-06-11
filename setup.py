from setuptools import setup, find_packages

setup (
    name='DevFetch',
    version='1.0.0',
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'devfetch=DevFetch.script:main',
        ],
    },
    install_requires=[
        #dependencies
    ],
    python_requires='>=3.10',
)