## WORM burn address creation script

### burnaddress.py: create a worm burn address

  - Original author: James C. Stroud
  - This program requires [base58](https://pypi.python.org/pypi/base58/0.2.1).

Call the program with a template burn address as the only argument:

    ```
    burnaddress.py.py WORMBurnAddressBurnPremineXXXXXX
    WORMBurnAddressBurnPremineXmtXTL
    ```

For instructions, call the program with no arguments::

    ```
    burnaddress.py.py
    usage: burnaddress.py.py TEMPLATE
       TEMPLATE - 34 letters & numbers (no zeros)
                  the first two are coin specific
    ```

An example template is accessible using "test" as the argument::

    ```
    burnaddress.py.py test
    WORMBurnAddressBurnPremineXmtXTL
    ```

Validate bitcoin burn addresses at [official worm blockexplorer](https://explorer.worm.com/address/)

