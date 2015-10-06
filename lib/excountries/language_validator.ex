defmodule Excountries.LanguageValidator do
  @valid_codes ~w(ab aa af sq am ar an hy as ay az ba eu bn dz bh bi br bg my be km ca zh zh-Hans zh-Hant co hr cs da nl en eo et fo fa fj fi fr fy gl gd gv ka de el kl gn gu ht ha he iw hi hu is io id in ia ie iu ik ga it ja jv kn ks kk rw ky rn ko ku lo la lv li ln lt mk mg ms ml mt mi mr mo mn na ne no oc or om ps pl pt pa qu rm ro ru sm sg sa sr sh st tn sn ii sd si ss sk sl so es su sw sv tl tg ta tt te th bo ti to ts tr tk tw ug uk ur uz vi vo wa cy wo xh yi ji yo zu)

  def validate! code do
    case code in @valid_codes do
      false -> throw "Language code: #{code} is not ISO 639-1 compliant."
      true -> :ok
    end
  end

end
