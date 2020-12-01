import $ from 'jquery'
import axios from 'modules/axios'

const handleCommentForm = () => {
  $('posts-show-comment-form').on('click', () => {
    $('posts-show-comment-form').addClass('hidden')
    $('posts-comment-text-area').removeClass('hidden')
  })
}