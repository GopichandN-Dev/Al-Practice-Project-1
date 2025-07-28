pageextension 50501 "Sales OrderExt" extends "Sales Order"
{
    layout
    {
        addlast(content)
        {
            group("Gopi Customs")
            {
                field("Customer Reference G"; Rec."Customer Reference G")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Reference G field.', Comment = '%';
                }
                field("Payment Method G"; Rec."Payment Method G")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Method G field.', Comment = '%';
                }
                field("Shipment Code G"; Rec."Shipment Code G")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shipment Code G field.', Comment = '%';
                }
                field("Customer Type G"; Rec."Customer Type G")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Type G field.', Comment = '%';
                }
            }
        }
    }
}
