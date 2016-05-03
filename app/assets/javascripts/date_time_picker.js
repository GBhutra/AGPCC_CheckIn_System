$(function () {
        $('#datetimepicker6').datetimepicker({
                    format: 'YYYY-MM-DD LT'
                });
        $('#datetimepicker7').datetimepicker({
            useCurrent: false, //Important! See issue #1075
            format: 'YYYY-MM-DD LT'
        });
        $("#datetimepicker6").on("dp.change", function (e) {
            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker7").on("dp.change", function (e) {
            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        });
    });