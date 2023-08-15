document.addEventListener 'DOMContentLoaded', ->
  applyButtons = document.querySelectorAll('.apply-button')
  
  openModal = (job, modalContainer) ->
    modalTitle = modalContainer.querySelector('.modal-title')
    modalBody = modalContainer.querySelector('.modal-body')

    modalTitle.textContent = job.title
    modalBody.innerHTML = """
      <h5>Offers: $#{job.salary}</h5>
      <p>#{job.description}</p>
      <!-- Additional content for modal body -->
    """

    modalContainer.style.display = 'block'
  
  closeModal = (modalContainer) ->
    modalContainer.style.display = 'none'
  
  for button in applyButtons
    button.addEventListener 'click', (event) ->
      event.preventDefault()
      job = JSON.parse event.currentTarget.dataset.job
      modalContainer = document.getElementById("jobModalContainer_#{job.id}")
      openModal(job, modalContainer)

  modalContainers = document.querySelectorAll('.modal-container')
  for container in modalContainers
    container.addEventListener 'click', (event) ->
      if event.target == container
        closeModal(event.currentTarget)

  modalCloseButtons = document.querySelectorAll('.close-button')
  for closeButton in modalCloseButtons
    closeButton.addEventListener 'click', (event) ->
      modalContainer = event.currentTarget.closest('.modal-container')
      closeModal(modalContainer)
      
  modalBackground = document.getElementById('modalBackground')
  modalBackground.addEventListener 'click', ->
    modalContainers = document.querySelectorAll('.modal-container')
    for container in modalContainers
      closeModal(container)
