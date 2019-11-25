
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyExpenses</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<%-- Reference: https://fontawesome.bootstrapcheatsheets.com/ --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%-- Include DataTables https://datatables.net/ --%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>

<%-- Include DatePicker plugin https://bootstrap-datepicker.readthedocs.io/en/stable/ --%>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Bubblegum+Sans" />

<style type="text/css">
    body {
        color: #404E67;
        background: #F5F7FA;
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	
	.table-wrapper {
		width: 700px;
		margin: 30px auto;
        background: #fff;
        padding: 20px;	
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
    .table-title {
        padding-bottom: 10px;
        margin: 0 0 10px;
    }
    .table-title h2 {
        margin: 6px 0 0;
        font-size: 22px;    
    }
    .table-title .add-new {        
		height: 30px;
		font-weight: bold;
		font-size: 12px;
		text-shadow: none;
		min-width: 100px;
		border-radius: 50px;
		line-height: 13px;
    }
	
	.table-title .add-new i {
		margin-right: 4px;
	}
	
    table.table {
        table-layout: fixed;
        word-wrap: break-word;
    }
    
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
    }
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }
    table.table th:last-child {
        width: 100px;
    }
    table.table td a {
		cursor: pointer;
        display: inline-block;
        margin: 0 5px;
		min-width: 24px;
    }    
	table.table td a.add {
        color: #27C46B;
    }
    table.table td a.edit {
        color: #FFC107; 
    }
    table.table td a.delete {
        color: #E27D60;
    }
    table.table td i {
        font-size: 19px;
    }    
    
	table.table td a.add i {
        font-size: 24px;
    	margin-right: -1px;
        position: relative;
        top: 3px;
    }    
     
    table.table .form-control {
        height: 32px;
        line-height: 32px;
        box-shadow: none;
        border-radius: 2px;
    }
   
	table.table .form-control.error {
		border-color: #f50000;
	}
	
	table.table td .add {
		display: none;
	}
	
	// class used to hide the first row, the itemID
	.hide {
	  position: absolute; 
	  left: -999em;
	}
	
	.chart-container {
    position: relative;
    margin: auto;
    width: 1000px;
    height: 350px;
	}		
	
	#datepicker {
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	max-width: 200px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	
	.show-all {
		height: 30px;
		font-weight: bold;
		font-size: 12px;
		text-shadow: none;
		min-width: 100px;
		border-radius: 50px;
		line-height: 13px;
	}
	
	.show-all i {
		margin-right: 4px;
	}
	
	.show-year {
		height: 30px;
		font-weight: bold;
		font-size: 12px;
		text-shadow: none;
		line-height: 13px;
	}
	
	.sum {
		font-size: 17px;
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}	
	
	.navbar-custom .navbar-brand,
	.navbar-custom .navbar-text{
		font-size: 45px;
		font-family: 'Bubblegum Sans', Helvetica, sans-serif;
	}
	
	
</style>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/plug-ins/1.10.20/api/sum().js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	//var yearMonth = "2019-12";
		
	// Add DataTable plugin to include pagination, search, sorting, etc. on the table
	$('#myTable').DataTable({
		"order": [[ 1, 'desc']],
		'sDom': 'lrtip',
		columnDefs: [
			{// display amount column with thousands separator ',' + decimal separator '.' + decimal places: 2 + prefix '$'
				targets: [2],
			    render: $.fn.dataTable.render.number(',', '.', 2, '$')
		    },
			{
				targets: [1,2,3,4,5,6],
				className: 'dt-center'
			} 		
		],	   
	});	
	var myTableVar = $('#myTable').DataTable();
	var sumExpense;
	var sumTotal;
	var sumBalance;
	var sumIncome
	var sumEnt;
	var sumTrans;
	var sumDining;
	var sumGroc;
	var sumMed;
	var sumGifts;
	var sumUtil;
	var sumOthers;
	
	// Plugin to insert text in the middle of the chart
	Chart.pluginService.register({
		  beforeDraw: function (chart) {
		    if (chart.config.options.elements.center) {
		      //Get ctx from string
		      var ctx = chart.chart.ctx;

		      //Get options from the center object in options
		      var centerConfig = chart.config.options.elements.center;
		      var fontStyle = centerConfig.fontStyle || 'Arial';
		      var txt = centerConfig.text;
		      var color = centerConfig.color || '#000';
		      var sidePadding = centerConfig.sidePadding || 20;
		      var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
		      //Start with a base font of 30px
		      ctx.font = "30px " + fontStyle;

		      //Get the width of the string and also the width of the element minus 10 to give it 5px side padding
		      var stringWidth = ctx.measureText(txt).width;
		      var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

		      // Find out how much the font can grow in width.
		      var widthRatio = elementWidth / stringWidth;
		      var newFontSize = Math.floor(30 * widthRatio);
		      var elementHeight = (chart.innerRadius * 2);

		      // Pick a new font size so it will not be larger than the height of label.
		      var fontSizeToUse = Math.min(newFontSize, elementHeight);

		      //Set font settings to draw it correctly.
		      ctx.textAlign = 'center';
		      ctx.textBaseline = 'middle';
		      var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
		      var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
		      ctx.font = fontSizeToUse+"px " + fontStyle;
		      ctx.fillStyle = color;

		      //Draw text in center
		      ctx.fillText(txt, centerX, centerY);
		    }
		  }
		}); 
	
	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: ["Everyday/Living", "Transportation", "Dining Out", "Groceries", "Personal/Medical", "Gifts", "Utilities", "Others"],
	    datasets: [{
	      backgroundColor: [
	        "#2acade",
	        "#00ceca",
	        "#0fd0ac",
	        "#50cf87",
	        "#7ecc5f",
	        "#a9c436",
	        "#d4b808",
	        "#ffa600"
	      ],
	      data: []
	    }]
	  },
	  options: {
	         responsive: true,
	         maintainAspectRatio: false,
	         layout: {
	             padding: {
	                 left: 0,
	                 right: 100,
	                 top: 0,
	                 bottom: 0
	             }
	         },
	         elements: {
	        	 center: {
					  text: 'Expenses',
			          color: '#E8A87C', // Default is #000000
			          fontStyle: 'Arial', // Default is Arial
			          sidePadding: 20 // Defualt is 20 (as a percentage)
				 }
	         },		  
		  	 legend: {
	            position: 'right'
	         },
	         plugins: {
	        	 labels: [
	        		    {
	        		      render: 'label',
	        		      fontColor: '#737580',
	        		      fontSize: 14,
	        		      textMargin: 5,
	        		      position: 'outside'	        		   
	        		    },
	        		    {
	        		      render: 'percentage'	        		      
	        		    }
	        		  ]
	         },
	         tooltips: {
                 displayColors: false,
	        	 callbacks: {
                   // this callback is used to create the tooltip label
                   label: function(tooltipItem, data) {
                     // get the data label and data value to display
                     // convert the data value to local string so it uses a comma seperated number
                     var dataLabel = data.labels[tooltipItem.index];
                     // add the currency symbol $ to the label
                     var value = ': $' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString();
                     // make sure this isn't a multi-line label (e.g. [["label 1 - line 1, "line 2, ], [etc...]])
                     if (Chart.helpers.isArray(dataLabel)) {
                       // show value on first line of multiline label
                       // need to clone because we are changing the value
                       dataLabel = dataLabel.slice();
                       dataLabel[0] += value;
                     } else {
                       dataLabel += value;
                     }
                     // return the text to display on the tooltip
                     return dataLabel;
                   }
                 }
             },
	    }
	});	
	
	// Add datepicker plugin
	$('#datepicker').datepicker({
	    format: "MM yyyy",
	    startView: "months", 
	    minViewMode: "months",
	    todayHighlight: true,
	    autoclose: true,
	}); 
	
	var reloaded = localStorage.getItem("reloaded");
	if (reloaded) {
		localStorage.removeItem("reloaded");		
		var date = new Date(localStorage.getItem('YearSave'), localStorage.getItem('MonthSave')-1, 1);				
		$('#datepicker').datepicker('update', date);	
		
		myTableVar.column(1).search('').column(4).search('').column(5).search('');
		myTableVar.column(1).search(localStorage.getItem('yearMonthSave')).draw();
		drawChart();
	} else {
		$('#datepicker').datepicker("setDate", new Date());
		drawChart();
	}; 
	
	function drawChart() {
		var selectedMonth = $('#datepicker').datepicker("getDate").getMonth() + 1;
		var selectedYear = $('#datepicker').datepicker("getDate").getFullYear();
		if (selectedMonth < 10){
			selectedMonth = "0" + selectedMonth;
		}
		yearMonth = selectedYear + "-" + selectedMonth;
		
		localStorage.setItem('yearMonthSave', yearMonth);
		localStorage.setItem('MonthSave', selectedMonth);
		localStorage.setItem('YearSave', selectedYear);
		
		// clear previous searches
		myTableVar.column(1).search('').column(4).search('').column(5).search('');
		// draw table with given yearMonth
		myTableVar.column(1).search(yearMonth).draw();		
		
		// calculate total amounts
		sumTotal = myTableVar.column(2, {search: 'applied'}).data().sum();		
		sumExpense = myTableVar.column(1).search(yearMonth).column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumIncome = myTableVar.column(1).search(yearMonth).column(5).search('Income').column(2, {search: 'applied'}).data().sum();
		localStorage.setItem('sumExpense', sumExpense);
		sumBalance = sumIncome - sumExpense;
		
		// calculate total amounts per category to send to chart
		sumEnt = myTableVar.column(1).search(yearMonth).column(4).search('Everyday/Living').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumTrans = myTableVar.column(1).search(yearMonth).column(4).search('Transportation').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumDining = myTableVar.column(1).search(yearMonth).column(4).search('Dining Out').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumGroc = myTableVar.column(1).search(yearMonth).column(4).search('Groceries').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumMed = myTableVar.column(1).search(yearMonth).column(4).search('Personal/Medical').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumGifts = myTableVar.column(1).search(yearMonth).column(4).search('Gifts').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumUtil = myTableVar.column(1).search(yearMonth).column(4).search('Utilities').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumOthers = myTableVar.column(1).search(yearMonth).column(4).search('Others').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		
		// set chart data with total amounts and update table
		myChart.data.datasets[0].data[0] = sumEnt;
		myChart.data.datasets[0].data[1] = sumTrans;
		myChart.data.datasets[0].data[2] = sumDining;
		myChart.data.datasets[0].data[3] = sumGroc;
		myChart.data.datasets[0].data[4] = sumMed;
		myChart.data.datasets[0].data[5] = sumGifts;
		myChart.data.datasets[0].data[6] = sumUtil;
		myChart.data.datasets[0].data[7] = sumOthers;
		myChart.update();
		myTableVar.column(1).search('').column(4).search('').column(5).search('');
		myTableVar.column(1).search(yearMonth)
		
		document.getElementById("totalIncome").innerHTML = "Income: <b>$" + Number(sumIncome).toFixed(2) + "</b>";
		document.getElementById("totalExpense").innerHTML = "Expense: <b>$" + Number(sumExpense).toFixed(2) + "</b>";
		if(sumBalance < 0){
			document.getElementById("Balance").innerHTML = "Balance: <b>-$" + Number(-sumBalance).toFixed(2) + "</b>";
		} else {
			document.getElementById("Balance").innerHTML = "Balance: <b>$" + Number(sumBalance).toFixed(2) + "</b>";
		}		
	};
	
	function drawChartShowAll(){
		var sumExpenseAll;
		var sumBalanceAll;
		var sumIncomeAll;
		var sumTotalAll;
		var sumEntAll;
		var sumTransAll;
		var sumDiningAll;
		var sumGrocAll;
		var sumMedAll;
		var sumGiftsAll;
		var sumUtilAll;
		var sumOthersAll;
		
		// calculate total amounts
		sumTotalAll = myTableVar.column(2).data().sum();		
		sumExpenseAll = myTableVar.column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumIncomeAll = myTableVar.column(5).search('Income').column(2, {search: 'applied'}).data().sum();
		sumBalanceAll = sumIncomeAll - sumExpenseAll;
		
		// calculate total amounts per category to send to chart
		sumEntAll = myTableVar.column(4).search('Everyday/Living').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumTransAll = myTableVar.column(4).search('Transportation').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumDiningAll = myTableVar.column(4).search('Dining Out').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumGrocAll = myTableVar.column(4).search('Groceries').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumMedAll = myTableVar.column(4).search('Personal/Medical').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumGiftsAll = myTableVar.column(4).search('Gifts').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumUtilAll = myTableVar.column(4).search('Utilities').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumOthersAll = myTableVar.column(4).search('Others').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		
		// set chart data with total amounts and update table
		myChart.data.datasets[0].data[0] = sumEntAll;
		myChart.data.datasets[0].data[1] = sumTransAll;
		myChart.data.datasets[0].data[2] = sumDiningAll;
		myChart.data.datasets[0].data[3] = sumGrocAll;
		myChart.data.datasets[0].data[4] = sumMedAll;
		myChart.data.datasets[0].data[5] = sumGiftsAll;
		myChart.data.datasets[0].data[6] = sumUtilAll;
		myChart.data.datasets[0].data[7] = sumOthersAll;
		myChart.update();
		myTableVar.column(1).search('').column(4).search('').column(5).search('');
		
		document.getElementById("totalIncome").innerHTML = "Income: <b>$" + Number(sumIncomeAll).toFixed(2) + "</b>";
		document.getElementById("totalExpense").innerHTML = "Expense: <b>$" + Number(sumExpenseAll).toFixed(2) + "</b>";
		if(sumBalanceAll < 0){
			document.getElementById("Balance").innerHTML = "Balance: <b>-$" + Number(-sumBalanceAll).toFixed(2) + "</b>";
		} else {
			document.getElementById("Balance").innerHTML = "Balance: <b>$" + Number(sumBalanceAll).toFixed(2) + "</b>";
		}		
		
	};
	
	function drawChartShowYear(selectedYear){
		var sumExpenseYear;
		var sumBalanceYear;
		var sumIncomeYear;
		var sumTotalYear;
		var sumEntYear;
		var sumTransYear;
		var sumDiningYear;
		var sumGrocYear;
		var sumMedYear;
		var sumGiftsYear;
		var sumUtilYear;
		var sumOthersYear;
		
		sumTotalYear = myTableVar.column(2, {search: 'applied'}).data().sum();		
		sumExpenseYear = myTableVar.column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumIncomeYear = myTableVar.column(5).search('Income').column(2, {search: 'applied'}).data().sum();
		sumBalanceYear = sumIncomeYear - sumExpenseYear;
		
		// calculate total amounts per category to send to chart
		sumEntYear = myTableVar.column(4).search('Everyday/Living').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumTransYear = myTableVar.column(4).search('Transportation').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumDiningYear = myTableVar.column(4).search('Dining Out').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumGrocYear = myTableVar.column(4).search('Groceries').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumMedYear = myTableVar.column(4).search('Personal/Medical').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumGiftsYear = myTableVar.column(4).search('Gifts').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumUtilYear = myTableVar.column(4).search('Utilities').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		sumOthersYear = myTableVar.column(4).search('Others').column(5).search('Expense').column(2, {search: 'applied'}).data().sum();
		
		// set chart data with total amounts and update table
		myChart.data.datasets[0].data[0] = sumEntYear;
		myChart.data.datasets[0].data[1] = sumTransYear;
		myChart.data.datasets[0].data[2] = sumDiningYear;
		myChart.data.datasets[0].data[3] = sumGrocYear;
		myChart.data.datasets[0].data[4] = sumMedYear;
		myChart.data.datasets[0].data[5] = sumGiftsYear;
		myChart.data.datasets[0].data[6] = sumUtilYear;
		myChart.data.datasets[0].data[7] = sumOthersYear;
		myChart.update();
		myTableVar.column(1).search('').column(4).search('').column(5).search('');
		
		document.getElementById("datepicker").value = selectedYear;
		
		document.getElementById("totalIncome").innerHTML = "Income: <b>$" + Number(sumIncomeYear).toFixed(2) + "</b>";
		document.getElementById("totalExpense").innerHTML = "Expense: <b>$" + Number(sumExpenseYear).toFixed(2) + "</b>";
		if(sumBalanceAll < 0){
			document.getElementById("Balance").innerHTML = "Balance: <b>-$" + Number(-sumBalanceYear).toFixed(2) + "</b>";
		} else {
			document.getElementById("Balance").innerHTML = "Balance: <b>$" + Number(sumBalanceYear).toFixed(2) + "</b>";
		}		
	}	
	
	$('#datepicker').datepicker().on('changeDate', function() {
		drawChart();		
	}); 
	
	$(".show-all").click(function(){
		myTableVar.column(1).search('').column(4).search('').column(5).search('').draw();
		$('#datepicker').datepicker('update', '');
		drawChartShowAll();
	});
	
	$(".show-year").click(function(){
		var selectedYear = $('#datepicker').datepicker("getDate").getFullYear();		
		if (selectedYear != ''){
			myTableVar.column(1).search('').column(4).search('').column(5).search('').draw();
			$('#datepicker').datepicker('update', '');
			myTableVar.column(1).search(selectedYear).draw();
			drawChartShowYear(selectedYear);
		}		
	});
		
	// Create a variable called newAdd to identify the difference between deletes on entries 
	// that don't exist in DB (ie. clicking the Add New button) vs entries that 
	// do exist in DB. The latter needing SQL statements to delete from DB whereas
	// the former doesn't require any SQL statements, just a UI delete in the table. 
	var newAdd = false;
	
	// script to ensure client side only enters valid amount ie. a number with max 2 decimal places
	$(document).on("keyup", "#amount", function(){	
		var valid = /^\d+(\.\d{0,2})?$/.test(this.value),
	    val = this.value;
	    
	    if(!valid){
	        this.value = val.substring(0, val.length - 1);
	    }
	});
		
	$('[data-toggle="tooltip"]').tooltip();	
	
	// get the add/edit/delete buttons in HTML
	var actions = $("table td:last-child").html();
	var actions = '<a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>' +
	'<a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>' +
	'<a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>';
    
    // when "Add New" button is clicked...
    $(".add-new").click(function(){
		//$(this).attr("disabled", "disabled");     
		newAdd = true;        
        // create text fields for user to enter new column info
        var row = '<tr>' +
            '<td><input type="date" class="form-control" name="date" id="date"></td>' +
            '<td><input type="number" class="form-control" name="amount" id="amount"></td>' +
            '<td><input type="text" class="form-control" name="description" id="description"></td>' +
            '<td><select class="form-control" name="category" id="category">' +
            	'<option value="Everyday/Living">Everyday/Living</option>' +
	            '<option value="Transportation">Transportation</option> ' + 
	            '<option value="Dining Out">Dining Out</option> ' +
	            '<option value="Groceries">Groceries</option> ' +
	            '<option value="Personal/Medical">Personal/Medical</option> ' +
	            '<option value="Gifts">Gifts</option> ' +
	            '<option value="Utilities">Utilities</option> ' +
	            '<option value="Others">Others</option>' +
	            '<option value="Income">Income</option></td>' +
            '<td><select class="form-control" name="type" id="type"><option value="Income">Income</option> <option value="Expense">Expense</option> </td>' +
			'<td>' + actions + '</td>' +
        '</tr>';
    	
    	// add new row to top of table
    	$("table").prepend(row);		
    	
    	//amount_validate();
    	// toggle to show add button and hide edit button
		$("table tbody tr").eq(0).find(".add, .edit").toggle(); 
        $('[data-toggle="tooltip"]').tooltip();
    });
    
	// when clicking the row's add button...
	$(document).on("click", ".add", function(){
		var empty = false;
		
		// on click, find the user's input on the row that was selected
		var input = $(this).parents("tr").find('.form-control');
		
	    // check if user has input in all columns
		input.each(function(){
			// if the input has no value... 
			if(!$(this).val()){
				// refer to css above - adds red border color
				$(this).addClass("error");
				empty = true;
			} else{
                // remove red border color
                $(this).removeClass("error");
            }
		});
		
		// add focus to the first error element
		$(this).parents("tr").find(".error").first().focus();			
		
		var checkID = $(this).parents("tr").find("#itemID").text();
		
		if (!empty){			
			var date = $(this).parents("tr").find("#date").val();
			var amount = $(this).parents("tr").find("#amount").val();
			var description = $(this).parents("tr").find("#description").val();
			var category = $(this).parents("tr").find("#category").val();							
			var itemType = $(this).parents("tr").find("#type").val();	
		}		
		
		// EDIT not New Add
		// if all fields are filled and ID already exists 
		if(!empty && checkID != ''){			
			input.each(function(){
				// the table data is saved to the user input
				$(this).parent("td").html($(this).val());							
			});						
			var editDate = $(this).parents("tr").find('#date').text();
			var editAmount = $(this).parents("tr").find('#amount').text();
			var editDescription = $(this).parents("tr").find('#description').text();
			var editCategory = $(this).parents("tr").find('#category').text();
			var editType = $(this).parents("tr").find('#type').text();
			
			// alert(editDate + editAmount + editDescription + editCategory + editType);
			
			$.ajax({
	      		type: "POST",
	      		url: "/MyExpenses/EditItem",
	      		data: {
	      			"ID": checkID,
	      			"Date": editDate,
	      			"Amount": editAmount,
	      			"Description": editDescription,
	      			"Category": editCategory,
	      			"Type": editType
	      		},
	      		async: false,
	      		success : function(data) {
	                $("#response").html(data.d);
	            }
	      	});    
			
			// toggle to hide add button and show edit button for the first row
			$(this).parents("tr").find(".add, .edit").toggle();
			
			// remove disabled flag
			$(".add-new").removeAttr("disabled");
		} 
		
		// New Add not EDIT
		// if all fields are filled and ID doesn't exist 
		if(!empty && checkID == ''){			
			input.each(function(){
				// the table data is saved to the user input
				$(this).parent("td").html($(this).val());
			});	
									
			// alert(date + amount + description + category + itemType);
			
			$.ajax({
	      		type: "POST",
	      		url: "/MyExpenses/CreateItem",
	      		data: {
	      			"Date": date,
	      			"Amount": amount,
	      			"Description": description,
	      			"Category": category,
	      			"Type": itemType
	      		},
	      		async: false,
	      		success : function(data) {
	                $("#response").html(data.d);
	            }
	      	});  
						
			// toggle to hide add button and show edit button for the first row
			$(this).parents("tr").find(".add, .edit").toggle();
						
			// remove disabled flag
			$(".add-new").removeAttr("disabled");				
		}
		localStorage.setItem("reloaded", "true");
		location.reload(true);
    });

	// Edit row on edit button click
	$(document).on("click", ".edit", function(){	       
		var saveCat = $(this).parents("tr").find("#category").text();	
		var saveType = $(this).parents("tr").find("#type").text();
		var saveAmt = $(this).parents("tr").find("#amount").text().substr(1);
		//alert($(this).parents("tr").find("#amount").text() + " " + $(this).parents("tr").find("#amount").html());
		
		$(this).parents("tr").find("#date").html('<input type="date" class="form-control" name="date" id="date" value = "' + $(this).parents("tr").find("#date").text() + '">');
        $(this).parents("tr").find("#amount").html('<input type="number" class="form-control" name="amount" id="amount">');
        $(this).parents("tr").find("#description").html('<input type="text" class="form-control" name="description" id="description" value = "' + $(this).parents("tr").find("#description").text() + '">');
        $(this).parents("tr").find("#category").html('<select class="form-control" name="category" id="category"> <option value="Everyday/Living">Everyday/Living</option><option value="Transportation">Transportation</option><option value="Dining Out">Dining Out</option><option value="Groceries">Groceries</option><option value="Personal/Medical">Personal/Medical</option><option value="Gifts">Gifts</option><option value="Utilities">Utilities</option><option value="Others">Others</option> <option value="Income">Income</option>');
        $(this).parents("tr").find("#type").html('<select class="form-control" name="type" id="type"> <option value="Income">Income</option> <option value="Expense">Expense</option>');
		   
     // use saved values so that the dropdowns have the previous values instead of default (first option)
		$(this).parents("tr").find("#category").val(saveCat);
		$(this).parents("tr").find("#type").val(saveType);
		$(this).parents("tr").find("#amount").val(saveAmt);
		
		// toggle to show add button and hide edit button
		$(this).parents("tr").find(".add, .edit").toggle();		
		
		// set newAdd flag to false 
		newAdd = false;
    });
	
	
	// Delete row on delete button click
	$(document).on("click", ".delete", function(){
        if (!newAdd){        	
        	// do SQL statements to delete existing entry
        	// remove the table row on click		
           	var id = $(this).parents("tr").find("#itemID").text();
            
          	$.ajax({
          		type: "POST",
          		url: "/MyExpenses/DeleteItem",
          		data: {
          			"ID": id
          		},
          		async: false,
          		success : function(data) {
                    $("#response").html(data.d);
                }
          	});       	
        }         
        $(this).parents("tr").remove();
		$(".add-new").removeAttr("disabled");
		localStorage.setItem("reloaded", "true");
		location.reload(true);
    });
});
</script>
</head>

<body>	
	<jsp:include page ="../common/headerMain.jsp"></jsp:include> 
	<div class = "container-fluid">
		<input id="datepicker" title="Change the selected month" data-toggle="tooltip">
		<button type="button" class="btn btn-info show-year" title="Show the entire year" data-toggle="tooltip" >
               <i class="fa fa-calendar"></i>
	    </button>		
	</div>
	<div class="container-fluid">
		<div class = "row">		
			<div class = "col-sm-2 mt-5">
				<div><p id="totalIncome" class="sum">Total Income: </p> </div>
		       	<div><p id="totalExpense" class="sum">Total Expense: </p> </div>
		       	<div><p id="Balance" class="sum">Balance: </p> </div>
			</div>			
			<div class = "col-sm-10">
				<div class = "chart-container">	
					<canvas id="myChart"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "container-fluid">
		<div class="table-title">
	        <div class="row">
	            <div class="col-sm-5">           		      		
            		<button type="button" class="btn btn-info add-new" >
	                	<i class="fa fa-plus"></i> Add New
	                </button>
            		<button type="button" class="btn btn-info show-all">
	                	<i class="fa fa-refresh"></i> Show All
	                </button>	   	            		
	            </div>
	            <div class="col-sm-7">	            	
	            </div>
	        </div>
	    </div>
	    
		<table class="table table-hover table-bordered" id="myTable">
			<thead class="thead-light">
				<tr>
					<th scope="col" class="hide"> ID </th>
					<th scope="col"> Date </th>
					<th scope="col"> Amount ($) </th>
					<th scope="col"> Description </th>
					<th scope="col"> Category </th>
					<th scope="col"> Type </th>
					<th scope="col"> Actions </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${itemsList}" var="item">
					<tr>
						<td id = "itemID" class="hide">${item.ID}</td>
						<td id = "date">${item.date}</td>
						<td id = "amount">${item.amount}</td>
						<td id = "description"><div style = "max-height:100px; overflow: auto">${item.description}</div></td>
						<td id = "category">${item.category}</td>
						<td id = "type">${item.itemType}</td>
						<td>
							<a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
							<a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
							<a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
						</td>									
					</tr>
				</c:forEach>			
			</tbody>
		</table>
	</div>
	<jsp:include page="../common/footerMain.jsp"></jsp:include> 
</body>
</html>       

