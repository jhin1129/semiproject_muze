$(document).ready(()=>{
	
	let today = $.datepicker.formatDate('yy-mm-dd', new Date()); 
	 
	 $('#srhbtn1').on('click', () => {
		let datepicker1 = $('#datepicker1').val(today);
		let datepicker2 = $('#datepicker2').val(today);
        
    });

	 $('#srhbtn2').on('click', () => {
		let day = new Date();
    	day.setDate(day.getDate() - 7);
		let day7 = $.datepicker.formatDate('yy-mm-dd', day);
		
		let datepicker1 = $('#datepicker1').val(day7);
		let datepicker2 = $('#datepicker2').val(today);
        
    });

	 $('#srhbtn3').on('click', () => {
		let day = new Date();
    	day.setDate(day.getDate() - 15);
		let day15 = $.datepicker.formatDate('yy-mm-dd', day);
		
		let datepicker1 = $('#datepicker1').val(day15);
		let datepicker2 = $('#datepicker2').val(today);
        
    });

	 $('#srhbtn4').on('click', () => {
		let day = new Date();
    	day.setDate(day.getDate() - 30);
		let day30 = $.datepicker.formatDate('yy-mm-dd', day);
		
		let datepicker1 = $('#datepicker1').val(day30);
		let datepicker2 = $('#datepicker2').val(today);
        
    });

	 $('#srhbtn5').on('click', () => {
		let day = new Date();
    	day.setDate(day.getDate() - 90);
		let day90 = $.datepicker.formatDate('yy-mm-dd', day);
		
		let datepicker1 = $('#datepicker1').val(day90);
		let datepicker2 = $('#datepicker2').val(today);
        
    });

	 $('#srhbtn6').on('click', () => {
		let day = new Date();
    	day.setDate(day.getDate() - 365);
		let day365 = $.datepicker.formatDate('yy-mm-dd', day);
		
		let datepicker1 = $('#datepicker1').val(day365);
		let datepicker2 = $('#datepicker2').val(today);
        
    });

});
