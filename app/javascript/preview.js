document.addEventListener('turbo:load', function(){
  const postForm = document.getElementById('new_post');

  const previewList = document.getElementById('previews');

  if (!postForm) return null;

  const fileField = document.querySelector('input[type="file"][name="post[image]"]');
  fileField.addEventListener('change', function(e){

    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const previewImageElement = document.getElementById('preview_image');

    previewImageElement.setAttribute('src', blob);
 
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
});

document.addEventListener('turbo:load', function(){
  const fileInput = document.querySelector('input[type="file"][name="tweet[image]"]');
  const previewImage = document.getElementById('preview_image');

  fileInput.addEventListener('change', function(e) {
    const file = e.target.files[0];
    const reader = new FileReader();

    reader.onload = function(e) {
      previewImage.src = e.target.result;
    };

    reader.readAsDataURL(file);
  });
});