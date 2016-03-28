require 'minitest/autorun'
require './issues'


class IssueTest < Minitest::Test

  def test_truth
    assert true
  end

  def test_class_exists
    assert Issue
  end

 def test_issue_can_list_issues
    api = Issue.new
    assert_equal 2, api.list.size
  end

end
