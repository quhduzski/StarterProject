report 50100 "Television Shows Report"
{
    ApplicationArea = All;
    Caption = 'Television Shows Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Television Shows Report.rdl';

    dataset
    {
        dataitem(TelevisionShow; "Television Show")
        {
            RequestFilterFields = Code, "First Aired", "Last Aired", Status;

            column(Code; "Code")
            {
            }
            column(Name; Name)
            {
            }
            column(First_Aired; "First Aired")
            {
            }
            column(Last_Aired; "Last Aired")
            {
            }

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
