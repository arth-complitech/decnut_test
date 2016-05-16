$ ->
  $(document).on 'change', '#groups_select', (evt) ->
    $.ajax '/departments/all_deps',
      type: 'GET'
      dataType: 'script'
      data: {
        group_id: $("#groups_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic group select OK!")
