# typed: true
class ResponseCodeType < T::Enum
  extend T::Sig

  enums do
    Approved = new("APPROVED")
    Declined = new("DECLINED")
  end
end
