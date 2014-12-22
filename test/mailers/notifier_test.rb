require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    mail = Notifier.order_received(orders(:one))
    assert_equal "Spirit Application Order Confirmation" , mail.subject
    assert_equal ["example@example.com" ], mail.to
    assert_equal ["spirit_application@example.com" ], mail.from
    assert_match /Programming Ruby 1.9/, mail.body.encoded
  end

  test "order_shipped" do
   mail = Notifier.order_shipped(orders(:one))
    assert_equal "Spirit Application Order Shipped" , mail.subject
    assert_equal ["example@example.com" ], mail.to
    assert_equal ["spirit_application@example.com" ], mail.from
    assert_match /<td>1<\/td>\s*<td>Programming Ruby 1.9<\/td>/,
    mail.body.encoded

  end

end

