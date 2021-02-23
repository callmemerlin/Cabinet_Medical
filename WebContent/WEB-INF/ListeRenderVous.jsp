<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- ===== BOX ICONS ===== -->
     <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
     
     <!-- ===== CSS ===== -->
     <link rel="stylesheet" href="css/styles.css">
     <link href="css/sb-admin-2.min.css" rel="stylesheet">
     
     <!-- ===== CSS font ===== -->
     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
     <!--lien dataTable.css-->
     <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">

     <title>Liste Rendez-Vous</title>
    </head>

    <%@ page import = "com.javaBeans.Appointment" %>
	<%@ page import = "java.util.ArrayList" %>
	<%@ page import = "java.util.Date" %>
	
	<body id="body-pd">
	
	<%@ include file="side-bar_doctor.jsp" %>
	
	<%
		ArrayList<Appointment> appointments = (ArrayList<Appointment>) request.getAttribute("appointments");

		if(request.getAttribute("action")!=null)
		{ 
			if(request.getAttribute("action").equals("supprimer"))
			{
	%>
				<div class="alert alert-danger" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				  	<strong>Rendez-Vous ! numéro <%= request.getAttribute("id_A") %></strong> est supprimer.   	
			    </div>
    <%
			}
		}
	%>
    
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <p class="mb-4">
        	Voici Tout les Rendez-Vous  
        </p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">les Rendez-Vous</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Nom de patient</th>
                                <th>Date fait</th>
                                <th>Date rendez-vous</th>
                                <th>Description</th>
                                <th>Type de malade</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<%
								for(Appointment appointment: appointments)
							    {
							%>
 
                            <tr>
                                <td><%= appointment.getPatient().getFirstName() + " " + appointment.getPatient().getLastName()%></td>
                                <td><%= appointment.getDateofChecking()%></td>
                                <td><%= appointment.getDateofAppointment()%></td>
                                <td><%= appointment.getDescription()%></td>
                                <td><%= appointment.getTypeofIllness()%></td>
                                <td>					        
					                
					                <form action="/CabinetMedicale/RendezVous" method="POST">						            
					                	<input type="hidden" name="id" value="<%= appointment.getId_appointment() %>" />	
					                	<input type="hidden" name="type" value="A" />
					                	<button class="btn btn-danger" type="submit"><i class="fas fa-calendar-times"></i></button>				                	
					                </form>
					                
								</td>
                                
                            </tr>
							<%
							    }
							%>                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <!-- End of Main Content -->
	
	<%@ include file="footer.jsp" %>   
	