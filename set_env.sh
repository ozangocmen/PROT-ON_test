#!/bin/bash
echo "Please enter the desired environment name:"
read environment_name

venv_path="$environment_name"

if [ -d "$venv_path" ]; then
    echo "Found an existing environment with the name '$environment_name'."
    echo "Do you want to use the existing environment? (y/n)"
    read use_existing

    if [ "$use_existing" == "y" ]; then
        source "$venv_path"/bin/activate
        echo "Activated existing virtual environment '$environment_name'."
    else
        echo "Aborted."
    fi
else
    python3 -m venv "$venv_path"
    source "$venv_path"/bin/activate
    echo "Virtual environment '$environment_name' has been created and activated."
fi

python setup.py
