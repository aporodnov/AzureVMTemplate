# AzureVMTemplate
Deploy Azure VMs into existing subnet

To execute the workflow, Service Principle should be create over subscription or management group, with at least contributor and deployment stacks owner roles assigned to SPN.

SPN in this use case was federated with GitHub, so no secrets required for the integration to work. 
