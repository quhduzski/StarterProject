pageextension 50100 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Television Viewing Country"; Rec."Television Viewing Country")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addlast(Navigation)
        {
            action("Television Shows")
            {
                ApplicationArea = All;
                Image = ListPage;
                RunObject = Page "Customer Television Shows";
                RunPageLink = "Customer No." = field("No.");
            }
            action("Customer Television Shows")
            {
                ApplicationArea = All;
                Image = ListPage;
                RunObject = Page "Customer Television Shows";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }
}
