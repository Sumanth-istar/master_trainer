	function handleTables() {

		$('.datatable_report').each(function(i, obj) {
				try {
					var tableID  = $(this).attr('id');
					var typeOfReport = $(this).data('graph_type');
					if(typeOfReport == 'table') {
					    console.log("handleTables -->     ID: " + tableID );
						$('#'+tableID).DataTable({
							initComplete: function () {
						            this.api().columns().every( function () {
						                var column = this;
						                var select = $('<select><option value=""></option></select>')
						                    .appendTo( $(column.footer()).empty() )
						                    .on( 'change', function () {
						                        var val = $.fn.dataTable.util.escapeRegex(
						                            $(this).val()
						                        );
						 
						                        column
						                            .search( val ? '^'+val+'$' : '', true, false )
						                            .draw();
						                    } );
						 
						                column.data().unique().sort().each( function ( d, j ) {
						                    select.append( '<option value="'+d+'">'+d+'</option>' )
						                } );
						            } );
						        }, 
							 responsive: true, 
							 stateSave: true, 
							 "pageLength": 10, 
							 dom: 'Bfrtip',
							 buttons: [
						            {
						                extend: 'excel',
						                filename: 'Data export'
						            },
						            {
						                extend: 'pdf',
						                filename: 'Data export'
						            }
						        ],  
						        "oLanguage": { "sSearch": '<i class="icon-search"></i>' }
							 });
					}
				} catch(e) {
					console.log(e);
				}
		});
	}
	
	function handleGraphs() {
		try{
		Highcharts.theme = {
				   colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', 
			             '#FF9655', '#FFF263', '#6AF9C4'],
				   
				   // General
				   background2: '#F0F0EA'

				};
		Highcharts.setOptions(Highcharts.theme);
		}catch(err){
			
		}
		/* 
		 *   plotOptions: {
            column: {
                stacking: 'percent'
            }
        },
		 */
		$('.datatable_report').each(function(i, obj) {
			try {
				var tableID  = $(this).attr('id');
				var graph_type = $(this).data('graph_type');//dateselector
				var dateselector = $(this).data('dateselector');
		    	if(graph_type.indexOf('table')<=-1) {
				    var containerID = $(this).data('graph_containter');
				    var graph_title = $(this).data('graph_title');
				    console.log("handleGraphs -->     ID: " + tableID + " ; TYPE: " + graph_type);
				    console.log("dateselector -->     : " + dateselector);
					if(dateselector) {
						console.log("dateselector -->     dateselector: ");						
						$('#'+containerID).highcharts('StockChart',{
					        data: {
					            table: tableID
					        },
					        chart: {
					            type: graph_type
					        },title: {
					            text: graph_title
					        },
					        tooltip: {
					            formatter: function () {
					                return  this.point.y ;
					            }
					        },
					       /* plotOptions: {
					            column: {
					                stacking: 'percent'
					            }
					        }*/
						});
					} else {
				    if(graph_type ==='stacked-column' && tableID=='datatable_report_304') {
				    	//Styling for PlacementOfficer Page  Batch Reports
						$('#'+containerID).highcharts({
					        data: {
					            table: tableID
					        },
					        chart: {
					            type: 'column',
					            height: 600
					        },title: {
					            text: graph_title
					        },
					        tooltip: {
					            formatter: function () {
					                return  this.point.y ;
					            }
					        } ,
					        plotOptions: {
					            column: {
					                stacking: 'normal'
					            }
					        }
						});
					} else if(graph_type ==='stacked-column') {
						$('#'+containerID).highcharts({
					        data: {
					            table: tableID
					        },
					        chart: {
					            type: 'column'
					        },title: {
					            text: graph_title
					        },
					        tooltip: {
					            formatter: function () {
					                return  this.point.y ;
					            }
					        } ,
					        plotOptions: {
					            column: {
					                stacking: 'normal'
					            }
					        }
						});
					} else if(tableID=='datatable_report_303'){
						//Styling for PlacementOfficer Page  Student Reports
						$('#'+containerID).highcharts({
					        data: {
					            table: tableID
					        },
					        chart: {
					            type: graph_type,
					            height: 600
					        },title: {
					            text: graph_title
					        },
					        tooltip: {
					            formatter: function () {
					                return  this.point.y ;
					            }
					        },
						});
					}else if(graph_type ==='pie'){
						$('#'+containerID).highcharts({
					        data: {
					            table: tableID
					        },
					        chart: {
					            type: graph_type
					        },title: {
					            text: graph_title
					        },
					        tooltip: {
					            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
					        },
					       plotOptions: {
					            pie: {
					                allowPointSelect: true,
					                cursor: 'pointer',
					                dataLabels: {
					                    enabled: true,
					                    format: '{point.name}',
					                    style: {
					                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
					                        width: '50px'
					                    }
					                }
					            }
					        }
						});
					}
					else{
						$('#'+containerID).highcharts({
					        data: {
					            table: tableID
					        },
					        chart: {
					            type: graph_type
					        },title: {
					            text: graph_title
					        },
					        tooltip: {
					            formatter: function () {
					                return  this.point.y ;
					            }
					        },
					       /* plotOptions: {
					            column: {
					                stacking: 'percent'
					            }
					        }*/
						});
					}}
			    }
			} catch (err) {
				console.log(err.stack);
				console.log("HighCharts not found");
			}
		});
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/* DO 
 * NOT 
 * TOUCH!
 * 
 * Essential intializations for Inspinia.
 */	
	
	
/*
 *
 *   INSPINIA - Responsive Admin Theme
 *   version 2.4
 *
 */
	function handleDropZoneForFileUpload() {
		try{
			 Dropzone.options.myAwesomeDropzone = {
		               autoProcessQueue: false,
		               uploadMultiple: true,
		               parallelUploads: 100,
		               maxFiles: 100,
		               // Dropzone settings
		               init: function() {
		                   var myDropzone = this;
		
		                   this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
		                       e.preventDefault();
		                       e.stopPropagation();
		                       myDropzone.processQueue();
		                   });
		                   this.on("sendingmultiple", function() {
		                   });
		                   this.on("successmultiple", function(files, response) {
		                   });
		                   this.on("errormultiple", function(files, response) {
		                   });
		               }
		          }
		} catch (e) {
			// NOTHING TO-DO
		}
	}
	
$(document).ready(function () {


    // Add body-small class if window less than 768px
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }

    // MetsiMenu
    $('#side-menu').metisMenu();

    // Collapse ibox function
    $('.collapse-link').click(function () {
        var ibox = $(this).closest('div.ibox');
        var button = $(this).find('i');
        var content = ibox.find('div.ibox-content');
        content.slideToggle(200);
        button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
        ibox.toggleClass('').toggleClass('border-bottom');
        setTimeout(function () {
            ibox.resize();
            ibox.find('[id^=map-]').resize();
        }, 50);
    });

    // Close ibox function
    $('.close-link').click(function () {
        var content = $(this).closest('div.ibox');
        content.remove();
    });

    // Fullscreen ibox function
    $('.fullscreen-link').click(function () {
        var ibox = $(this).closest('div.ibox');
        var button = $(this).find('i');
        $('body').toggleClass('fullscreen-ibox-mode');
        button.toggleClass('fa-expand').toggleClass('fa-compress');
        ibox.toggleClass('fullscreen');
        setTimeout(function () {
            $(window).trigger('resize');
        }, 100);
    });

    // Close menu in canvas mode
    $('.close-canvas-menu').click(function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();
    });

    // Run menu of canvas
    $('body.canvas-menu .sidebar-collapse').slimScroll({
        height: '100%',
        railOpacity: 0.9
    });

    // Open close right sidebar
    $('.right-sidebar-toggle').click(function () {
        $('#right-sidebar').toggleClass('sidebar-open');
    });

    // Initialize slimscroll for right sidebar
    $('.sidebar-container').slimScroll({
        height: '100%',
        railOpacity: 0.4,
        wheelStep: 10
    });

    // Open close small chat
    $('.open-small-chat').click(function () {
        $(this).children().toggleClass('fa-comments').toggleClass('fa-remove');
        $('.small-chat-box').toggleClass('active');
    });

    // Initialize slimscroll for small chat
    $('.small-chat-box .content').slimScroll({
        height: '234px',
        railOpacity: 0.4
    });

    // Small todo handler
    $('.check-link').click(function () {
        var button = $(this).find('i');
        var label = $(this).next('span');
        button.toggleClass('fa-check-square').toggleClass('fa-square-o');
        label.toggleClass('todo-completed');
        return false;
    });

    // Append config box / Only for demo purpose
    // Uncomment on server mode to enable XHR calls
    //$.get("skin-config.html", function (data) {
    //    if (!$('body').hasClass('no-skin-config'))
    //        $('body').append(data);
    //});

    // Minimalize menu
    $('.navbar-minimalize').click(function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();

    });

    // Tooltips demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    });

    // Move modal to body
    // Fix Bootstrap backdrop issu with animation.css
    $('.modal').appendTo("body");

    // Full height of sidebar
    function fix_height() {
        var heightWithoutNavbar = $("body > #wrapper").height() - 61;
        $(".sidebard-panel").css("min-height", heightWithoutNavbar + "px");

        var navbarHeigh = $('nav.navbar-default').height();
        var wrapperHeigh = $('#page-wrapper').height();

        if (navbarHeigh > wrapperHeigh) {
            $('#page-wrapper').css("min-height", navbarHeigh + "px");
        }

        if (navbarHeigh < wrapperHeigh) {
            $('#page-wrapper').css("min-height", $(window).height() + "px");
        }

        if ($('body').hasClass('fixed-nav')) {
            if (navbarHeigh > wrapperHeigh) {
                $('#page-wrapper').css("min-height", navbarHeigh - 60 + "px");
            } else {
                $('#page-wrapper').css("min-height", $(window).height() - 60 + "px");
            }
        }

    }

    fix_height();

    // Fixed Sidebar
    $(window).bind("load", function () {
        if ($("body").hasClass('fixed-sidebar')) {
            $('.sidebar-collapse').slimScroll({
                height: '100%',
                railOpacity: 0.9
            });
        }
    });

    // Move right sidebar top after scroll
    $(window).scroll(function () {
        if ($(window).scrollTop() > 0 && !$('body').hasClass('fixed-nav')) {
            $('#right-sidebar').addClass('sidebar-top');
        } else {
            $('#right-sidebar').removeClass('sidebar-top');
        }
    });

    $(window).bind("load resize scroll", function () {
        if (!$("body").hasClass('body-small')) {
            fix_height();
        }
    });

    $("[data-toggle=popover]")
        .popover();

    // Add slimscroll to element
    $('.full-height-scroll').slimscroll({
        height: '100%'
    })
    
    //DropZones
    handleDropZoneForFileUpload();
    
    // handle tables 
    handleTables();
 
    // handle graphs 
    handleGraphs();
    
    
});


// Minimalize menu when screen is less than 768px
$(window).bind("resize", function () {
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }
});

// Local Storage functions
// Set proper body class and plugins based on user configuration
$(document).ready(function () {
    if (localStorageSupport) {

        var collapse = localStorage.getItem("collapse_menu");
        var fixedsidebar = localStorage.getItem("fixedsidebar");
        var fixednavbar = localStorage.getItem("fixednavbar");
        var boxedlayout = localStorage.getItem("boxedlayout");
        var fixedfooter = localStorage.getItem("fixedfooter");

        var body = $('body');

        if (fixedsidebar == 'on') {
            body.addClass('fixed-sidebar');
            $('.sidebar-collapse').slimScroll({
                height: '100%',
                railOpacity: 0.9
            });
        }

        if (collapse == 'on') {
            if (body.hasClass('fixed-sidebar')) {
                if (!body.hasClass('body-small')) {
                    body.addClass('mini-navbar');
                }
            } else {
                if (!body.hasClass('body-small')) {
                    body.addClass('mini-navbar');
                }

            }
        }

        if (fixednavbar == 'on') {
            $(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
            body.addClass('fixed-nav');
        }

        if (boxedlayout == 'on') {
            body.addClass('boxed-layout');
        }

        if (fixedfooter == 'on') {
            $(".footer").addClass('fixed');
        }
    }
});

// check if browser support HTML5 local storage
function localStorageSupport() {
    return (('localStorage' in window) && window['localStorage'] !== null)
}

// For demo purpose - animation css script
function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            //wait for animation to finish before removing classes
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

function SmoothlyMenu() {
    if (!$('body').hasClass('mini-navbar') || $('body').hasClass('body-small')) {
        // Hide menu in order to smoothly turn on when maximize menu
        $('#side-menu').hide();
        // For smoothly turn on menu
        setTimeout(
            function () {
                $('#side-menu').fadeIn(400);
            }, 200);
    } else if ($('body').hasClass('fixed-sidebar')) {
        $('#side-menu').hide();
        setTimeout(
            function () {
                $('#side-menu').fadeIn(400);
            }, 100);
    } else {
        // Remove all inline style from jquery fadeIn function to reset menu state
        $('#side-menu').removeAttr('style');
    }
}

// Dragable panels
function WinMove() {
    var element = "[class*=col]";
    var handle = ".ibox-title";
    var connect = "[class*=col]";
    $(element).sortable(
        {
            handle: handle,
            connectWith: connect,
            tolerance: 'pointer',
            forcePlaceholderSize: true,
            opacity: 0.8
        })
        .disableSelection();
}


