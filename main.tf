{
   "properties": {
      "displayName": "Allowed virtual machine SKUs",
      "policyType": "BuiltIn",
      "mode": "Indexed",
      "description": "This policy enables you to specify a set of virtual machine SKUs that your organization can deploy.",
      "metadata": {
         "version": "1.0.0",
         "category": "Compute"
      },
      "parameters": {
         "listOfAllowedSKUs": {
            "type": "Array",
            "metadata": {
               "description": "The list of SKUs that can be specified for virtual machines.",
               "displayName": "Allowed SKUs",
               "strongType": "VMSKUs"
            }
         }
      },
      "policyRule": {
         "if": {
            "allOf": [
               {
                  "field": "type",
                  "equals": "Microsoft.Compute/virtualMachines"
               },
               {
                  "not": {
                     "field": "Microsoft.Compute/virtualMachines/sku.name",
                     "in": "[parameters('listOfAllowedSKUs')]"
                  }
               }
            ]
         },
         "then": {
            "effect": "Deny"
         }
      }
   },
   "id": "/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3",
   "name": "cccc23c7-8427-4f53-ad12-b6a63eb452b3"
}
