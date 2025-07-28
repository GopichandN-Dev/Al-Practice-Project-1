table 50502 "Student Marks"
{
    Caption = 'Student Marks';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
            AutoIncrement = true;
        }
        field(2; "Student ID"; Code[20])
        {
            Caption = 'Student ID';
        }
        field(3; Subject; Text[50])
        {
            Caption = 'Subject';
        }
        field(4; Marks; Decimal)
        {
            Caption = 'Marks';
            trigger OnValidate()
            var
                Rank: Code[20];
            begin
                if Marks >= 95 then
                    Rank := 'A+'
                else if (Marks >= 90) then
                    Rank := 'A'
                else if (Marks >= 85) then
                    Rank := 'B+'
                else if (Marks >= 80) then
                    Rank := 'B'
                else if (Marks >= 75) then
                    Rank := 'C+'
                else if (Marks >= 70) then
                    Rank := 'C'
                else if (Marks >= 65) then
                    Rank := 'D+'
                else if (Marks >= 60) then
                    Rank := 'D'
                else if (Marks >= 55) then
                    Rank := 'E+'
                else if (Marks >= 40) then
                    Rank := 'E'
                else if (Marks <> 0) AND (Marks < 35) then
                    Rank := 'F'
                else if Marks = 0 then
                    Rank := 'AB';

                if Rank = 'AB' then
                    "Result Status" := "Result Status"::Absent
                else if Rank = 'F' then
                    "Result Status" := "Result Status"::Fail
                else if (Rank in ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'E+', 'E']) then
                    "Result Status" := "Result Status"::Pass
                else
                    "Result Status" := "Result Status"::" ";
            end;
        }
        field(5; "Result Status"; Enum "Result Status")
        {
            Caption = 'Result Status';
        }
    }
    keys
    {
        key(PK; "Entry No.", "Student ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        StudentHdr: Record "Student Header";
    begin
        if StudentHdr.Get("Student ID") then begin
            StudentHdr.Refresher := NOT StudentHdr.Refresher;
            StudentHdr.Modify(true);
        end;
    end;

    trigger OnModify()
    var
        StudentHdr: Record "Student Header";
    begin
        if StudentHdr.Get("Student ID") then begin
            StudentHdr.Refresher := NOT StudentHdr.Refresher;
            StudentHdr.Modify(true);
        end;
    end;

}
