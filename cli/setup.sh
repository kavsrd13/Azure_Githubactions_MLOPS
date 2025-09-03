

# <az_ml_install>
az extension add -n ml -y
# </az_ml_install>

## For backward compatibility - running on old subscription
# <set_variables>
GROUP="rg-dp100-labs"
LOCATION="swedencentral"
WORKSPACE="azuremlopsresources"
SUBSCRIPTION_ID="42848f6c-f0f7-4143-b9d3-76441ceeda99"                 
# </set_variables>

# If RESOURCE_GROUP_NAME is empty, the az configure is pending.
RESOURCE_GROUP_NAME=${RESOURCE_GROUP_NAME:-}
if [[ -z "$RESOURCE_GROUP_NAME" ]]
then
    echo "No resource group name [RESOURCE_GROUP_NAME] specified, defaulting to ${GROUP}."
    # Installing extension temporarily assuming the run is on old subscription
    # without bootstrap script.

    # <az_configure_defaults>
    az configure --defaults group=$GROUP workspace=$WORKSPACE location=$LOCATION
    # </az_configure_defaults>
    echo "Default resource group set to $GROUP"
else
    echo "Workflows are using the new subscription."
fi


# <export_env_for_sdk>
export AZURE_SUBSCRIPTION_ID=$SUBSCRIPTION_ID
export AZURE_RESOURCE_GROUP=$GROUP
export AZURE_WORKSPACE_NAME=$WORKSPACE
# </export_env_for_sdk>
