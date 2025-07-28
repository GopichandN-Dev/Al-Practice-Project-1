report 50501 CustomerReport
{
    ApplicationArea = All;
    Caption = 'CustomerReport';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Src/Reports/CustomerReport.rdl';
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "Country/Region Code";
            column(No; "No.") { }
            column(Name; Name) { }
            column(PhoneNo; "Phone No.") { }
            column(Balance; Balance) { }
            column(CountryRegionCode; "Country/Region Code") { }
        }
    }
}
