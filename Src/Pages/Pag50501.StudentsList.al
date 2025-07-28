page 50501 "Students List"
{
    ApplicationArea = All;
    Caption = 'Students List';
    PageType = List;
    SourceTable = "Student Header";
    UsageCategory = Lists;
    CardPageId = "Student Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Student ID"; Rec."Student ID")
                {
                    ToolTip = 'Specifies the value of the Student ID field.', Comment = '%';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ToolTip = 'Specifies the value of the Student Name field.', Comment = '%';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ToolTip = 'Specifies the value of the Date of Birth field.', Comment = '%';
                }
                field(Age; Rec.Age)
                {
                    ToolTip = 'Specifies the value of the Age field.', Comment = '%';
                }
                field(Grade; Rec.Grade)
                {
                    ToolTip = 'Specifies the value of the Grade field.', Comment = '%';
                }
                field("Std. Grade"; Rec."Std. Grade")
                {
                    ToolTip = 'Specifies the value of the Std. Grade field.', Comment = '%';
                }
                field("Date of Joining "; Rec."Date of Joining ")
                {
                    ToolTip = 'Specifies the value of the Date of Joining field.', Comment = '%';
                }
                field("Average Marks"; Rec."Average Marks")
                {
                    ToolTip = 'Specifies the value of the Average Marks field.', Comment = '%';
                }
                field("Results Status"; Rec."Results Status")
                {
                    ToolTip = 'Specifies the value of the Results Status field.', Comment = '%';
                }
            }
        }
    }
}
