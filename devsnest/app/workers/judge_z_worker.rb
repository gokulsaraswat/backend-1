class JudgeZWorker
  include Sidekiq::Worker

  def perform(test_case_id, submission_id, source_code, lang_id)
    res = AlgoSubmission.post_to_judgez(source_code, lang_id, test_case_id)
    raise "Could not post to judge0" if res.nil?
    
    Judgeztoken.create(submission_id: submission_id, token: res["token"])
  end
end
