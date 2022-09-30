<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/css/fullcalendar-5.11.3/lib/main.css">
<script type="text/javascript"
	src="/css/fullcalendar-5.11.3/lib/main.js"></script>
<script type="text/javascript"
	src="/css/fullcalendar-5.11.3/lib/main.min.js"></script>

<script>

    var calendar = null;

    $(document).ready(function() {
        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendar.Draggable;

        var containerEl = document.getElementById('external-events');
        var calendarEl = document.getElementById('calendar');
        var checkbox = document.getElementById('drop-remove');

        
		
        // initialize the external events
        // -----------------------------------------------------------------
        new Draggable(containerEl, {
        itemSelector: '.fc-event',
        eventData: function(eventEl) {
            return {
            title: eventEl.innerText
            };
        }
    	
        });

        // initialize the calendar
        // -----------------------------------------------------------------
        calendar = new Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        editable: true,  // �������� ����
        droppable: true, // �巹�� ��� ����
        drop: function(info) {
            // is the "remove after drop" checkbox checked?
            if (checkbox.checked) {
            // if so, remove the element from the "Draggable Events" list
            info.draggedEl.parentNode.removeChild(info.draggedEl);
            }
        },
     
        locale : 'ko' 
    });

    calendar.render();
  });

    
//���� ���� �ϱ�    
  $(function(){

    $(".allSave").on("click", function(){

       var allEevent = calendar.getEvents();// calender�� ��� event�� ������ array���·� �����´�.

       var event = new Array();

        for (let i = 0; i < allEevent.length; i++) {
      
            var obj = new Object();

             obj.title = allEevent[i]._def.title// �̺�Ʈ ��Ī
             obj.allday = allEevent[i]._def.allDay// �Ϸ��������� �˷��ִ� boolen�� t/f
             obj.start = allEevent[i]._instance.range.start; // ���� �ð�
             obj.end = allEevent[i]._instance.range.end; //���ð�

             event.push(obj); // data�� json���� ����� Array��ü�� ���� �ֱ�
        }

        var JSONData = JSON.stringify(event);
        
           console.log(JSONData);

     	   savedata(JSONData);
    });
    
 });

  function savedata(JSONData){
	  
	  alert("������ �����մϴ�");
	
	  var JSONData = JSONData
	  
	  //console.log(JSONData);
	  
        $.ajax({
            url  : "/user/json/calender",
            method : "POST",
			contentType : 'application/json; charset=utf-8',
			dataType	: "json",
            data : JSON.stringify({
            	data : JSONData
            }),
            type : "text",
            
            success : function (JSONData, status) {
        	alert(status);
        	
            } 
		
       });		      
		 
  }; 
 
  
  //���� �߰� �ϱ�
  $(function () {
	  
	  $(".addDay").on("click", function() {	
		   var dateStr = prompt('Enter a date in YYYY-MM-DD format');
           var date = new Date(dateStr + 'T00:00:00'); // �Է��� �ð�

           
           if (!isNaN(date.valueOf())) { // �Է��� �ð��� valueCheck
               calendar.addEvent({
                 title: dataTitle,
                 start: date,
                 Text: dateText,
                 allDay: true
               });
               alert('Great. Now, update your database...');
             } else {
               alert('Invalid date.');
             }           
           
	  });
	  
});	


  



</script>

<style>
.fc-event {
	margin-top: 5px;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class='demo-topbar'>

		<div id='external-events'
			style="float: left; width: 20%; margin-top: 75px; padding: 5px;">

			<p>
				<strong>���� ���</strong>
			</p>

			<div
				class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>My Event 1</div>
			</div>
			<div
				class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>My Event 2</div>
			</div>
			<div
				class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>My Event 3</div>
			</div>
			<div
				class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>My Event 4</div>
			</div>
			<div
				class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>My Event 5</div>
			</div>

			<p>
				<input type='checkbox' id='drop-remove' /> <label for='drop-remove'>�巹��
					�� ����</label>
			</p>
		</div>

		<div id='calendar-container' style="float: left; width: 75%;">
			<div
				style="height: 30px; text-align: center; font-size: 30px; font-weight: bold; color: rgba(69, 69, 199, 0.721); margin-bottom: 20px;">���� ����</div>
			<input type="button" class="allSave" value="��ü ����">
			<input type="button" class="addDay" value="���� �߰�">
			<div id='calendar'></div>

		</div>
	</div>
</body>
</html>

</body>
</html>