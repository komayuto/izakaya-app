<<<<<<< HEAD
import $ from 'jquery'
=======
import $ from 'jquery'
import axios from 'modules/axios'

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })
}

const appendNewComment = (comment) => {
  $('.comments-container').append(
    `<div class="post_comment"><p>${escape(comment.content)}</p></div>`
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#post-show').data()
  const postId = dataset.postId

  axios.get(`/api/posts/${postId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment(comment)
      })
    })

  handleCommentForm()

  $('.add-comment-button').on('click', () => {
    const content = $(`#comment_content`).val()
    if (!content) {
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/api/posts/${postId}/comments`, {
        comment: {content: content}
      })
        .then((res) => {
          const comment = res.data
          appendNewComment(comment)
          $(`#comment_content`).val('')
        })
    }
  })
})
>>>>>>> comment
