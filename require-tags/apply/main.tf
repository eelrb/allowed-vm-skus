resource "azurerm_policy_assignment" "requiredTag" {
  name                 = "Audit-RequiredTag-${var.requiredTag}"
  display_name         = "Assign Required Tag '${var.requiredTag}'"
  description          = "Assignment of Required Tag Policy for '${var.requiredTag}'"
  policy_definition_id = "???"
  scope                = "???"
  parameters           = "???"
  }
  
  data "azurerm_policy_definition" "reqTag" id {
  
  }
  
  sub var
  
  data "template_file" "requiredTag_policy_assign" {
  template = <<PARAMETERS
{
    "tagName": {
        "value": "${var.requiredTag}"
    }
}
​
PARAMETERS
}
​
resource "azurerm_policy_assignment" "requiredTag" {
  ...
  parameters           = "${data.template_file.requiredTag_policy_assign.rendered}"
}
