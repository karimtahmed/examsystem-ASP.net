<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="fontawesome-free-5.13.1-web/css/all.min.css" rel="stylesheet"> 
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" href="css/hover-min.css" >
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 115px;
        }
        .lol {
            text-decoration: none!important;
            color:#3f3a64!important;
            font-size: 16px!important; 
            font-weight: 500!important;
            line-height: 1.375!important;
        }
      *{
        font-family: 'Roboto', sans-serif!important;
        box-sizing: border-box!important;
        }
      .hvr-underline-from-left:before{
         background: #50A4AC;
        }
      .navshov{
    
             transition:color 0.3s ease-in-out;
     
        }
      .navshov:hover{
            color: #50A4AC!important;
    
        }
      .navbar-brand {
    
    margin-right: 10rem!important;
   
}

        .sss{
            font-size: 18px;
            font-weight: 400;
            color: #111 ;
            transition:color 0.3s ease-in-out;
        }
        .sss:hover {
            color: #50A4AC!important;
        }
        .fa, .far, .fas {
             font-family: "Font Awesome 5 Free"!important;
        }
        .navbar-light {
            color: #3f3a64!important;
        }
        .search-container input[type=text] {
          padding: 6px 20px;
          margin-top: 8px;
          font-size: 15px;
          border: 1px solid #f5f5f5;
          border-top-left-radius: 5px;
          border-bottom-left-radius: 5px;
          background-color: #f5f5f5;
          color: #696969;
        }

        .search-container button {
          float: right;
          padding: 6px 10px;
          margin-top: 8px;
          margin-right: 16px;
          background: #f5f5f5;
          border: 1px solid #f5f5f5;
          border-top-right-radius: 5px;
          border-bottom-right-radius: 5px;
          font-size: 17px;
          border: none;
          transition:background 0.3s ease-in-out;
          color: #50A4AC;
        }
        #i1 {
          
 
        }
        .search-container button:hover {
          background: #50A4AC;
          color:#f5f5f5!important;
        }
        .bg-light {
            background-color: white!important;
        }
        
        .auto-style8 {
            width: 115px;
        }
        .auto-style9 {
            width: 115px;
        }
        .auto-style10 {
            width: 115px;
        }
        
    </style>
</head>
<body class="pt-5 mt-3" style="padding-top:0px!important;padding-bottom:0px!important;margin-top:0px!important:">
     <header id="navbar_top" style="padding-top:0px!important;padding-bottom:0px!important;margin-top:0px!important:" class="shadow-sm p-3 mb-3 bg-white rounded fixed-top ">
         <div class="container" style="padding-top:0px!important;padding-bottom:0px!important;max-width: 1300px; max-height: 120px!important;">  
              <nav class="navbar navbar-expand-md" style="padding-top:0px!important;padding-bottom:0px!important;margin-top:0px!important:">
                  <a class="navbar-brand" href="#" style="max-width:158px;"><img src="loop (1).png" width="100px" style="line-height: 1.375;max-width: 100%;"></a>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <form id="form1" runat="server" class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <table aria-setsize="50" class="auto-style1 navbar-nav ml-auto mr-3">
                <tr>
                    <td class="auto-style2 ">
                        <asp:HyperLink class="lol nav-link hvr-underline-from-left navshov" ID="HyperLink1" runat="server" Font-Names="Arial Black" Font-Size="Medium" ForeColor="Black" NavigateUrl="~/signup.aspx" Target="F4" Font-Overline="False" Font-Underline="False">Nav</asp:HyperLink>
                    </td>
                    <td class="auto-style9">
                        <asp:HyperLink class="lol nav-link hvr-underline-from-left navshov" ID="HyperLink2" runat="server" Font-Names="Arial Black" Font-Size="Medium" ForeColor="Black" NavigateUrl="http://www.fue.edu.eg" Target="_top">Nav</asp:HyperLink>
                    </td>
                    <td class="auto-style8">
                        <asp:HyperLink class="lol nav-link hvr-underline-from-left navshov" ID="HyperLink3" runat="server" Font-Names="Arial Black" Font-Size="Medium" ForeColor="Black" NavigateUrl="http://www.EgyptAir.com" Target="_top">Nav</asp:HyperLink>
                    </td>
                    <td class="auto-style10">
                        <asp:HyperLink class="lol nav-link hvr-underline-from-left navshov" ID="HyperLink4" runat="server" Font-Names="Arial Black" ForeColor="Black" NavigateUrl="~/signup.aspx" Target="F4">Sign Up</asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink class="lol nav-link hvr-underline-from-left navshov" ID="HyperLink5" runat="server" Font-Names="Arial Black" ForeColor="Black" NavigateUrl="~/signin.aspx" Target="F4">Sign In</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
                       <a class=""><i class="far fa-user-circle sss mt-2 mr-3"></i></a>
          <form class="form-inline " action="">
          <div class="search-container">
              
              <input class="form-control" type="text" placeholder="Search.." name="search">
              <button type="submit"><i class="fa fa-search" id="i1"></i></button>
            </div>
          </form>
    </header>
    </div>
    </nav>
    </div>
</body>
</html>
