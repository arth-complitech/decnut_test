$ ->
  $(document).on 'change', '#user_group_id', (evt) ->
    $.ajax '/departments/all_deps',
      type: 'GET'
      dataType: 'script'
      data: {
        group_id: $("#user_group_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic group select OK!")
