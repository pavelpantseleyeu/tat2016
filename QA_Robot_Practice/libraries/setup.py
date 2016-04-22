from distutils.core import setup

setup(
    name='robotframework-utils',
    description='Common util keywords for Robot Framework',
    author='Artyom Gabeev, Pavel Pantseleyeu',
    author_email='<artyom.gabeev@clarabridge.com>, <pavel.pantseleyeu@clarabridge.com>',
    packages=['UtilsLibrary'],
    version='1.6.1',
    requires=['robotframework','suds'],
)