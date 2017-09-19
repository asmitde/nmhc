<%@ Page Title="Hospital | Clinical Monitoring" Language="C#" MasterPageFile="~/ClinicalMonitoring/ClinicalMonitoring.master" AutoEventWireup="true" CodeFile="ClinicalParams.aspx.cs" Inherits="ClinicalMonitoring_ClinicalParams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainContent" Runat="Server">
	<div>
		<h2>Clinical Parameters</h2>
	</div>
	<br />
	<br />
	<div>
        <h3>Search Patient</h3>
        <br />
        <table style="width: 100%">
            <tr>
                <td>
            Search by</td>
                <td colspan="2">
                    <asp:RadioButtonList ID="SearchBy" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Registration ID</asp:ListItem>
                <asp:ListItem>Bed No.</asp:ListItem> 
            </asp:RadioButtonList>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="SearchBox" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Search" runat="server" Text="Search" onclick="Search_Click" 
                        CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Literal ID="RegID" runat="server"></asp:Literal>
                </td>
                <td colspan="2">
                    <asp:Literal ID="PName" runat="server"></asp:Literal>
                </td>
                <td colspan="2">
                    <asp:Literal ID="PBed" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
    </div>
	<br />
	<asp:LinkButton ID="Complaints" runat="server" onclick="Complaints_Click">Patient Complaints</asp:LinkButton>
	<asp:LinkButton ID="OnExam" runat="server" onclick="OnExam_Click">OnExamination</asp:LinkButton>
	<asp:LinkButton ID="VitalSigns" runat="server" onclick="VitalSigns_Click">Vital Signs</asp:LinkButton>
	<asp:LinkButton ID="ClinicalParams" runat="server" onclick="ClinicalParams_Click">Clinical Parameters</asp:LinkButton>
	<asp:LinkButton ID="IntakeOutput" runat="server" onclick="IntakeOutput_Click">Intake / Output</asp:LinkButton>
	<asp:LinkButton ID="Ventilator" runat="server" onclick="Ventilator_Click">Ventilator Monitoring</asp:LinkButton>
	<asp:LinkButton ID="Cannulas" runat="server" OnClick="Cannulas_Click">Checklist (Cannulas...)</asp:LinkButton>
	<br />
	<br />
	<div>
        <asp:MultiView ID="MultiView1" runat="server" ViewStateMode="Enabled">
            <asp:View ID="View1" runat="server">
				<div>
					<asp:Label ID="DF" runat="server" Text="Date of Log:" />
					<asp:DropDownList ID="DateFilter" runat="server" AutoPostBack="True" 
						ViewStateMode="Enabled">
					</asp:DropDownList>
					<asp:ListView ID="ListView1" runat="server" DataKeyNames="P_ID,LogDate,LogTime" 
						 DataSourceID="EntityDataSource1" InsertItemPosition="LastItem" >
						<InsertItemTemplate>
							<tr style="">
								<td>
									<asp:TextBox ID="LogTimeTextBox" runat="server" Text='<%# Bind("LogTime") %>' />
								</td>
								<td>
									<asp:TextBox ID="GCSTotalTextBox" runat="server" 
										Text='<%# Bind("GCSTotal") %>' />
								</td>
								<td>
									<asp:TextBox ID="GCSETextBox" runat="server" Text='<%# Bind("GCSE") %>' />
								</td>
								<td>
									<asp:TextBox ID="GCSMTextBox" runat="server" Text='<%# Bind("GCSM") %>' />
								</td>
								<td>
									<asp:TextBox ID="GCSVTextBox" runat="server" Text='<%# Bind("GCSV") %>' />
								</td>
								<td>
									<asp:DropDownList ID="PlantorResponseRightList" runat="server" 
										Text='<%# Bind("PlantarResponseRight") %>' >
										<asp:ListItem>Extensor</asp:ListItem>
										<asp:ListItem>Flexor</asp:ListItem>	
										<asp:ListItem>Equivocal</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="PlantarResponseLeftList" runat="server" 
										Text='<%# Bind("PlantarResponseLeft") %>' >
										<asp:ListItem>Extensor</asp:ListItem>
										<asp:ListItem>Flexor</asp:ListItem>	
										<asp:ListItem>Equivocal</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="PallorList" runat="server" Text='<%# Bind("Pallor") %>' >
										<asp:ListItem>Absent</asp:ListItem>
										<asp:ListItem>Mild</asp:ListItem>
										<asp:ListItem>Moderate</asp:ListItem>
										<asp:ListItem>Severe</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="CyanosisList" runat="server" 
										Text='<%# Bind("Cyanosis") %>' >
										<asp:ListItem>Absent></asp:ListItem>
										<asp:ListItem>Central+</asp:ListItem>
										<asp:ListItem>Central++</asp:ListItem>
										<asp:ListItem>Central+++</asp:ListItem>
										<asp:ListItem>Peripheral+</asp:ListItem>
										<asp:ListItem>Peripheral++</asp:ListItem>
										<asp:ListItem>Peripheral+++</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="EdemaList" runat="server" Text='<%# Bind("Edema") %>' >
										<asp:ListItem>Absent</asp:ListItem>
										<asp:ListItem>Bipedal+</asp:ListItem>
										<asp:ListItem>Sacral+</asp:ListItem>
										<asp:ListItem>Pretibial+</asp:ListItem>
										<asp:ListItem>Periorbital+</asp:ListItem>
										<asp:ListItem>Parietal+</asp:ListItem>
										<asp:ListItem>Right Upper Limb - Pitting+</asp:ListItem>
										<asp:ListItem>Right Upper Limb - Non Pitting+</asp:ListItem>
										<asp:ListItem>Right Lower Limb - Pitting+</asp:ListItem>
										<asp:ListItem>Right Lower Limb - Non Pitting+</asp:ListItem>
										<asp:ListItem>Left Upper Limb - Pitting+</asp:ListItem>
										<asp:ListItem>Left Upper Limb - Non Pitting+</asp:ListItem>
										<asp:ListItem>Left Lower Limb - Pitting+</asp:ListItem>
										<asp:ListItem>Left Lower Limb - Non Pitting+</asp:ListItem>
										<asp:ListItem>Bipedal++</asp:ListItem>
										<asp:ListItem>Sacral++</asp:ListItem>
										<asp:ListItem>Pretibial++</asp:ListItem>
										<asp:ListItem>Periorbital++</asp:ListItem>
										<asp:ListItem>Parietal++</asp:ListItem>
										<asp:ListItem>Right Upper Limb - Pitting++</asp:ListItem>
										<asp:ListItem>Right Upper Limb - Non Pitting++</asp:ListItem>
										<asp:ListItem>Right Lower Limb - Pitting++</asp:ListItem>
										<asp:ListItem>Right Lower Limb - Non Pitting++</asp:ListItem>
										<asp:ListItem>Left Upper Limb - Pitting++</asp:ListItem>
										<asp:ListItem>Left Upper Limb - Non Pitting++</asp:ListItem>
										<asp:ListItem>Left Lower Limb - Pitting++</asp:ListItem>
										<asp:ListItem>Left Lower Limb - Non Pitting++</asp:ListItem>
										<asp:ListItem>Bipedal+++</asp:ListItem>
										<asp:ListItem>Sacral+++</asp:ListItem>
										<asp:ListItem>Pretibial+++</asp:ListItem>
										<asp:ListItem>Periorbital+++</asp:ListItem>
										<asp:ListItem>Parietal+++</asp:ListItem>
										<asp:ListItem>Right Upper Limb - Pitting+++</asp:ListItem>
										<asp:ListItem>Right Upper Limb - Non Pitting+++</asp:ListItem>
										<asp:ListItem>Right Lower Limb - Pitting+++</asp:ListItem>
										<asp:ListItem>Right Lower Limb - Non Pitting+++</asp:ListItem>
										<asp:ListItem>Left Upper Limb - Pitting+++</asp:ListItem>
										<asp:ListItem>Left Upper Limb - Non Pitting+++</asp:ListItem>
										<asp:ListItem>Left Lower Limb - Pitting+++</asp:ListItem>
										<asp:ListItem>Left Lower Limb - Non Pitting+++</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="ClubbingList" runat="server" 
										Text='<%# Bind("Clubbing") %>' >
										<asp:ListItem>Grade 1</asp:ListItem>
										<asp:ListItem>Grade 2</asp:ListItem>
										<asp:ListItem>Grade 3</asp:ListItem>
										<asp:ListItem>Grade 4</asp:ListItem>
										<asp:ListItem>HPOA</asp:ListItem>	
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="JaundiceList" runat="server" Text='<%# Bind("Jaundice") %>' >
										<asp:ListItem>Absent</asp:ListItem>
										<asp:ListItem>Mild</asp:ListItem>
										<asp:ListItem>Moderate</asp:ListItem>
										<asp:ListItem>Severe</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="NeckVeinsList" runat="server" 
										Text='<%# Bind("NeckVeins") %>' >
										<asp:ListItem>Not Engorged</asp:ListItem>
										<asp:ListItem>Engorged & Pulsatile</asp:ListItem>
										<asp:ListItem>Engorged & Non Pulsatile</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:TextBox ID="IPSTextBox" runat="server" Text='<%# Bind("IPS") %>' />
								</td>
								<td>
									<asp:TextBox ID="AbdominalGirthTextBox" runat="server" 
										Text='<%# Bind("AbdominalGirth") %>' />
								</td>
								<td>
									<asp:DropDownList ID="CrepitationsRightLungList" runat="server" 
										Text='<%# Bind("CrepitationsRightLung") %>' >
										<asp:ListItem>Absent</asp:ListItem>
										<asp:ListItem>Upper Zone+</asp:ListItem>
										<asp:ListItem>Upper Zone++</asp:ListItem>
										<asp:ListItem>Upper Zone+++</asp:ListItem>
										<asp:ListItem>Middle Zone+</asp:ListItem>
										<asp:ListItem>Middle Zone++</asp:ListItem>
										<asp:ListItem>Middle Zone+++</asp:ListItem>
										<asp:ListItem>Basal Zone+</asp:ListItem>
										<asp:ListItem>Basal Zone++</asp:ListItem>
										<asp:ListItem>Basal Zone+++</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="CrepitationsLeftLungList" runat="server" 
										Text='<%# Bind("CrepitationsLeftLung") %>' >
										<asp:ListItem>Absent</asp:ListItem>
										<asp:ListItem>Upper Zone+</asp:ListItem>
										<asp:ListItem>Upper Zone++</asp:ListItem>
										<asp:ListItem>Upper Zone+++</asp:ListItem>
										<asp:ListItem>Middle Zone+</asp:ListItem>
										<asp:ListItem>Middle Zone++</asp:ListItem>
										<asp:ListItem>Middle Zone+++</asp:ListItem>
										<asp:ListItem>Basal Zone+</asp:ListItem>
										<asp:ListItem>Basal Zone++</asp:ListItem>
										<asp:ListItem>Basal Zone+++</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="RhonchiRightLungList" runat="server" 
										Text='<%# Bind("RhonchiRightLung") %>' >
										<asp:ListItem>Absent></asp:ListItem>
										<asp:ListItem>Present+</asp:ListItem>
										<asp:ListItem>Present++</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="RhonchiLeftLungList" runat="server" 
										Text='<%# Bind("RhonchiLeftLung") %>' >
										<asp:ListItem>Absent></asp:ListItem>
										<asp:ListItem>Present+</asp:ListItem>
										<asp:ListItem>Present++</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:TextBox ID="CBGRandomTextBox" runat="server" 
										Text='<%# Bind("CBGRandom") %>' />
								</td>
								<td>
									<asp:TextBox ID="SPO2TextBox" runat="server" Text='<%# Bind("SPO2") %>' />
								</td>
								<td>
									<asp:TextBox ID="O2TextBox" runat="server" Text='<%# Bind("O2") %>' />
								</td>
								<td>
									<asp:TextBox ID="CVPTextBox" runat="server" Text='<%# Bind("CVP") %>' />
								</td>
								<td>
									<asp:TextBox ID="PCWPTextBox" runat="server" Text='<%# Bind("PCWP") %>' />
								</td>
								<td>
									<asp:TextBox ID="ETCO2TextBox" runat="server" Text='<%# Bind("ETCO2") %>' />
								</td>
								<td>
									<asp:TextBox ID="FiO2TextBox" runat="server" Text='<%# Bind("FiO2") %>' />
								</td>
								<td>
									<asp:DropDownList ID="O2DeliveryDeviceList" runat="server" 
										Text='<%# Bind("O2DeliveryDevice") %>' >
										<asp:ListItem>N/A</asp:ListItem>
										<asp:ListItem>Nasal Cannula</asp:ListItem>
										<asp:ListItem>Binasal Prong</asp:ListItem>
										<asp:ListItem>O2 Tent</asp:ListItem>
										<asp:ListItem>Orofacial Mask</asp:ListItem>
										<asp:ListItem>Venturi Mask</asp:ListItem>
										<asp:ListItem>LMA</asp:ListItem>
										<asp:ListItem>ET Tube / Tracheostomy Tube</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
										Text="Insert" />
									<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
										Text="Clear" />
								</td>
							</tr>
						</InsertItemTemplate>
						<ItemTemplate>
							<tr style="">
								<td>
									<asp:Label ID="LogTimeLabel" runat="server" Text='<%# Eval("LogTime") %>' />
								</td>
								<td>
									<asp:Label ID="GCSTotalLabel" runat="server" Text='<%# Eval("GCSTotal") %>' />
								</td>
								<td>
									<asp:Label ID="GCSELabel" runat="server" Text='<%# Eval("GCSE") %>' />
								</td>
								<td>
									<asp:Label ID="GCSMLabel" runat="server" Text='<%# Eval("GCSM") %>' />
								</td>
								<td>
									<asp:Label ID="GCSVLabel" runat="server" Text='<%# Eval("GCSV") %>' />
								</td>
								<td>
									<asp:Label ID="PlantarResponseRightLabel" runat="server" 
										Text='<%# Eval("PlantarResponseRight") %>' />
								</td>
								<td>
									<asp:Label ID="PlantarResponseLeftLabel" runat="server" 
										Text='<%# Eval("PlantarResponseLeft") %>' />
								</td>
								<td>
									<asp:Label ID="PallorLabel" runat="server" Text='<%# Eval("Pallor") %>' />
								</td>
								<td>
									<asp:Label ID="CyanosisLabel" runat="server" Text='<%# Eval("Cyanosis") %>' />
								</td>
								<td>
									<asp:Label ID="EdemaLabel" runat="server" Text='<%# Eval("Edema") %>' />
								</td>
								<td>
									<asp:Label ID="ClubbingLabel" runat="server" Text='<%# Eval("Clubbing") %>' />
								</td>
								<td>
									<asp:Label ID="JaundiceLabel" runat="server" Text='<%# Eval("Jaundice") %>' />
								</td>
								<td>
									<asp:Label ID="NeckVeinsLabel" runat="server" Text='<%# Eval("NeckVeins") %>' />
								</td>
								<td>
									<asp:Label ID="IPSLabel" runat="server" Text='<%# Eval("IPS") %>' />
								</td>
								<td>
									<asp:Label ID="AbdominalGirthLabel" runat="server" 
										Text='<%# Eval("AbdominalGirth") %>' />
								</td>
								<td>
									<asp:Label ID="CrepitationsRightLungLabel" runat="server" 
										Text='<%# Eval("CrepitationsRightLung") %>' />
								</td>
								<td>
									<asp:Label ID="CrepitationsLeftLungLabel" runat="server" 
										Text='<%# Eval("CrepitationsLeftLung") %>' />
								</td>
								<td>
									<asp:Label ID="RhonchiRightLungLabel" runat="server" 
										Text='<%# Eval("RhonchiRightLung") %>' />
								</td>
								<td>
									<asp:Label ID="RhonchiLeftLungLabel" runat="server" 
										Text='<%# Eval("RhonchiLeftLung") %>' />
								</td>
								<td>
									<asp:Label ID="CBGRandomLabel" runat="server" Text='<%# Eval("CBGRandom") %>' />
								</td>
								<td>
									<asp:Label ID="SPO2Label" runat="server" Text='<%# Eval("SPO2") %>' />
								</td>
								<td>
									<asp:Label ID="O2Label" runat="server" Text='<%# Eval("O2") %>' />
								</td>
								<td>
									<asp:Label ID="CVPLabel" runat="server" Text='<%# Eval("CVP") %>' />
								</td>
								<td>
									<asp:Label ID="PCWPLabel" runat="server" Text='<%# Eval("PCWP") %>' />
								</td>
								<td>
									<asp:Label ID="ETCO2Label" runat="server" Text='<%# Eval("ETCO2") %>' />
								</td>
								<td>
									<asp:Label ID="FiO2Label" runat="server" Text='<%# Eval("FiO2") %>' />
								</td>
								<td>
									<asp:Label ID="O2DeliveryDeviceLabel" runat="server" 
										Text='<%# Eval("O2DeliveryDevice") %>' />
								</td>
								<td>
									<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
										Text="Delete" />
								</td>
							</tr>
						</ItemTemplate>
						<LayoutTemplate>
							<table runat="server">
								<tr runat="server">
									<td runat="server">
										<table ID="itemPlaceholderContainer" runat="server" border="0" style="">
											<tr runat="server" style="">
												<th id="Th1" runat="server">
													Log Time</th>
												<th runat="server">
													GCS Total</th>
												<th runat="server">
													GCSE</th>
												<th runat="server">
													GCSM</th>
												<th runat="server">
													GCSV</th>
												<th runat="server">
													Plantar Response Right</th>
												<th runat="server">
													Plantar Response Left</th>
												<th runat="server">
													Pallor</th>
												<th runat="server">
													Cyanosis</th>
												<th runat="server">
													Edema</th>
												<th runat="server">
													Clubbing</th>
												<th runat="server">
													Jaundice</th>
												<th runat="server">
													Neck Veins</th>
												<th runat="server">
													IPS</th>
												<th runat="server">
													Abdominal Girth</th>
												<th runat="server">
													Crepitations Right Lung</th>
												<th runat="server">
													Crepitations Left Lung</th>
												<th runat="server">
													Rhonchi Right Lung</th>
												<th runat="server">
													Rhonchi Left Lung</th>
												<th runat="server">
													CBG Random</th>
												<th runat="server">
													SPO2</th>
												<th runat="server">
													O2</th>
												<th runat="server">
													CVP</th>
												<th runat="server">
													PCWP</th>
												<th runat="server">
													ETCO2</th>
												<th runat="server">
													FiO2</th>
												<th runat="server">
													O2 Delivery Device</th>
												<th runat="server">
												</th>
											</tr>
											<tr ID="itemPlaceholder" runat="server">
											</tr>
										</table>
									</td>
								</tr>
								<tr runat="server">
									<td runat="server" style="">
									</td>
								</tr>
							</table>
						</LayoutTemplate>
					</asp:ListView>
					<asp:EntityDataSource ID="EntityDataSource1" runat="server" 
						ConnectionString="name=NMHCDatabaseEntities" 
						DefaultContainerName="NMHCDatabaseEntities" EnableDelete="True" 
						EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
						EntitySetName="Clinical_Monitoring__Clinical_Parameters" 
						Where="it.[P_ID] = @param_PID && it.[LogDate] = @param_Date" AutoSort="False" 
						OrderBy="it.[LogTime] desc"
						oninserting="EntityDataSource1_Inserting" 
						ondeleted="EntityDataSource1_Deleted" oninserted="EntityDataSource1_Inserted">
						<WhereParameters>
							<asp:QueryStringParameter Name="param_PID" QueryStringField="PID" 
								Type="String" />
							<asp:ControlParameter ControlID="DateFilter" Name="param_Date" 
								PropertyName="SelectedValue" Type="DateTime" />
						</WhereParameters>
					</asp:EntityDataSource>
				</div>
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                    <h3>
                        Search Result
                    </h3>
                    <p>
                        Sorry, your search did not return any results. The Patient does not exist or is not registered under this hospital.</p>
            </asp:View>
        </asp:MultiView>
    </div>
	
</asp:Content>
