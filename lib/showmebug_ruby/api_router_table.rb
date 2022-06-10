require 'pry'
module ShowmebugRuby
  class ApiRouterTable

    HOST_PATH = 'https://staging.showmebug.com'
    def self.table
      {
        post_oauth: { url: '/oauth/token.json' },
        get_me: { url: '/open_api/v1/me' },
        post_team_members: { url: '/open_api/v1/team_members' },
        get_console_link: { url: '/open_api/v1/console_link' },
        post_token: { url: '/open_api/v1/token' },
        get_exams: { url: '/open_api/v1/exams' },
        delete_exam: { url: '/open_api/v1/exams/:id', url_params_key: ':id' },
        get_exam_link: { url: '/open_api/v1/exams/:id/exam_link', url_params_key: ':id' },
        patch_exam_link: { url: '/open_api/v1/exams/:id/exam_link', url_params_key: ':id' },
        get_exam_rooms: { url: '/open_api/v1/exam_rooms' },
        get_written_questions: { url: '/open_api/v1/written_questions' },
        get_written_question: { url: '/open_api/v1/written_questions/:id', url_params_key: ':id' },
        post_written_questions: { url: '/open_api/v1/written_questions' },
        post_batch_written_questions: { url: '/open_api/v1/batch_written_questions' },
        delete_written_question: { url: '/open_api/v1/written_questions/:id', url_params_key: ':id' },
        post_written_pads: { url: '/open_api/v1/written_pads' },
        post_batch_written_pads: { url: '/open_api/v1/batch_written_pads' },
        get_written_pads: { url: '/open_api/v1/written_pads' },
        get_written_pad: { url: '/open_api/v1/written_pads/:uid', url_params_key: ':uid' },
        delete_written_pad: { url: '/open_api/v1/written_pads/:uid', url_params_key: ':uid' },
        get_video: { url: '/open_api/v1/videos/:id', url_params_key: ':id' },
        get_skill_dimensions: { url: '/open_api/v1/skill_dimensions' },
        post_interviews: { url: '/open_api/v1/interviews' },
        get_interview_result: { url: '/open_api/v1/interviews/:uid/result', url_params_key: ':uid' },
        post_batch_interviews: { url: '/open_api/v1/batch_interviews' },
        get_interviews: { url: '/open_api/v1/interviews' },
        delete_interview: { url: '/open_api/v1/interviews/:uid', url_params_key: ':uid' },
        get_questions: { url: '/open_api/v1/questions' },
        post_questions: { url: '/open_api/v1/questions' },
        post_batch_questions: { url: '/open_api/v1/batch_questions' },
        delete_question: { url: '/open_api/v1/questions/:id', url_params_key: ':id' },
        post_accounts: { url: '/open_api/v1/accounts' },
        post_candidate_pad_links: { url: '/open_api/v1/candidate_pad_links' },
        post_candidate_written_pad_links: { url: '/open_api/v1/candidate_written_pad_links' }
      }
    end
  end
end
