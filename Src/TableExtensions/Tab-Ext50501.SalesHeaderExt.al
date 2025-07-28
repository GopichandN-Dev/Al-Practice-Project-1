tableextension 50501 "Sales HeaderExt" extends "Sales Header"
{
    fields
    {
        field(50501; "Customer Reference G"; Text[50])
        {
            Caption = 'Customer Reference G';
            DataClassification = ToBeClassified;
        }
        field(50502; "Payment Method G"; Enum "Payment Method G")
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                if "Payment Method G" = "Payment Method G"::Cheque then
                    if "External Document No." = '' then
                        Error('Please Fill the External Document No.');
            end;
        }
        field(50503; "Shipment Code G"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50504; "Customer Type G"; Enum "Customer Type G")
        {
            Caption = 'Customer Type G';
            DataClassification = ToBeClassified;
        }
    }
    trigger OnInsert()
    var
        CustomerRec: Record Customer;
    begin
        if "Shipment Code G" = '' then begin
            if CustomerRec.Get("Sell-to Customer No.") then
                "Shipment Code G" := CustomerRec."Shipment Method Code";
        end;
        if "Customer Type G" = "Customer Type G"::" " then begin
            if CustomerRec.Get("Sell-to Customer No.") then begin
                "Customer Type G" := CustomerRec."Customer Type G";
            end;
        end;
    end;
}
