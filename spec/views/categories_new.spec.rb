require 'rails_helper'

RSpec.describe 'Categories index', type: :system do
  describe 'Check the content of categories index' do
    before(:each) do
      user = User.create(name:'mike', email:'mike@gmail.com' ,password:'mike123');
      group = Group.create(name:'Fast food', icon:'https://cdn-icons-png.flaticon.com/512/732/732060.png', user_id:user.id)
      group2 = Group.create(name:'Clothes', icon:'https://media.istockphoto.com/vectors/creative-clothes-logo-design-vector-id1148638300', user_id:user.id)
      cost = Cost.create(name:'Hamburguer', amount: 50, user_id:user.id)
      cost2 = Cost.create(name:'Fries', amount: 25, user_id:user.id)
      cost3 = Cost.create(name:'Hoodie', amount: 500, user_id:user.id)
      CostGroup.create(cost_id:cost.id, group:group)
      CostGroup.create(cost_id:cost2.id, group:group)
      CostGroup.create(cost_id:cost3.id, group:group2)      
      visit root_path
      sleep(2)
      fill_in 'user_email', with: 'mike@gmail.com'
      fill_in 'user_password', with: 'mike123'
      click_button 'Log in'
      sleep(2)
      click_link 'Add Category'
      sleep(2)
    end
    it 'it shows the correct inputs' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Icon')
    end   
    it 'it shows the correct category after adding it' do
        fill_in 'group_name', with: 'Video Games'
        fill_in 'group_icon', with: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARYAAAC1CAMAAACtbCCJAAABXFBMVEXqPU7////m5ubl5eXy8/Pk5OTx8vIzMzPCvZ74+Pj7+/vu7u7r6+vs7Oz8/PwAAADpHTW/w6IhICAYFxfw8OzqM0bqOErnSFInJyfEv54LCgrz4eLxPlC+uZfz6OjqLkLqJjyRkZHU0LsAHBr0/fzSlILr1NUEBQyGfmza2MrxnaMcIB8AGBbrVWLo8vHj4tnsvsHzqK3shIv5y87sanTrXWgSHx7teoLrtbj53uDpEzDGNUPtkpjGx8fsg4quq6vFtZjiXl/RnYrgdXOKMzmHQ0dTLC63Mz7py8xPISXEQk0AIiD+9PU7JyatMT1pIil1ODqfOEDTNUR6KTE/JCajMjs8JCRPMzOZLDdeJSpqAA64IjLtrq4xJR0iGhV9fHdIRUE9PDaurKBQSjtpaGOYkHWin56EgYFGPTtFPy+gnIVtZFVsaF2qqaZbVlDMrZbefnjIxLfXjH/faWZijZakAAAaaElEQVR4nOVdiXvbxpUnQBDmkOApAtQNmKZlSw5BSqKsI7QjW91WTZR0u2l3u7tK7KRJnTiNncb///ftHJiLwOAiKCnfPtvSM0lBMz+84zczmDclDYpR1vUKU5pQAUipBUoZQKVWCZQmVTSkGFQxkaJDpS4pFlQagaJbSKmXA8XwG/rO4WRv9vxiNCpt/u5pt/v030YvDg5m15NJWfc12g7aoHItRTuwUg41yBKUuXYgRadKGSlmuXQrsMAub0z2pqO257q27TilUmnz90+63Qd/2HQcx3Zdt+0eHe9fXg196+7CkqY5qWExff9y79hpuwQOKpt/xLDwFxzH9bz+8/0dZjY3DkulXMawAElp4lZApYZbARUgKhpSDKrgVpShQmChigVfalAFteJqf+p5tghIIPcQLJ9uzr3q2J79/BD+1nLQjlpCO+QG6ZENwmg0KoFSh4pOFQJLpWQgMaEUrphzigGGp3tHbTcCEiSfdbvdjyLfsT1vemINDaOYdigV4cdK5dg7XSF3Og7YwL6MkMIsLlCuro/aUWYSyEcQlgfzxsKMxnWnh5qvR7VDz9SOdBZX0lPEhUakG5LmSGGJKSw+BYrlHx4r7QTJ5qcPVrtPPlfBgpDx3NmGr4oLJo0LRqhBIBQwa+Wk+HQTsNR8a7/kxWCCYPniAczPf4qBBYp9Np34NwNLBQqGBSkEFqpYULEkpQ4VnSqBE0EhNjuvAKSg5lzNXDe2uwgWTFv+PR4WZDL9E3SfcrUDK8SJoBBYAgX33uCKnKBBhQJboQmaKigxVijCFUWCho4eWBxVLL888+wkUCAsf0KJ6IskWFCUKV37TXU7DNoOU26HqFBD4wp1gXJa3iLCkoO3NFKBAmFZhbB8FMrPkeI6kzgH0OJ5i4DGrbHcazvRfQJYHijzc4R4o0PyW2+dziUltXCSN7XDvpeynzARQVi6aWEpOe3pFUzXmehceY7OlRPpXN0060UokA7VCUWC37aP2/HZR4TlD5DNPfljKh8KgPH24C+OaZA536A0Cv35WDpX4XSukpnOnbipgkoAC05EX2aABYaY0elvjc5pV1MvSxfx+PnpnzPBAj1pb6j/luicf5LefwgsXZSf/yPTz0BxS5D3/lbonG4dtzP272M0UFzJigqKMNe+rmrHwnSOmiJW8BWQUqMKTtBUaSLFCMxKp/lQpxan17WNfoaogmXzzzARxY6IlOIda+EG6XKDiOUTpQEV7AJ1lqmZI3JljuXG07lKGt4yzOpACJYvUcT9XR5YSnZ/x0rBW2JZ7vJn5/xZVgdCsPyFzFjmgQU60sS/43RON7NlICp4DipzxKXS3vfVdK6cSOfKEXQOQDHqUMKKEamAGMXYHmUNK0g2v0BzUJ/lMxYk3gEINchMUEza17BSMJ3Tt0uZwwqG5cvsZE4Wd9rQ7yqds3bi5t/iYHnaTTeroBb7qH5H6Zy14+Xs08d4HncBUBAuo4ZeICyMzpUXpHN6blTwgOjJXxYxFowLWasshs41oRi6ZelMqUEFSAoQlRpSDPRpqmj4rY28qAQDor8tCAvExWQN0i3dRIoFlbqkNJCiQaUOFQsqTaaYUNGJoqJzodnLBDqn50el1EdzLQ8+XhCVIL7konPlZc3OLYAKnvR/kn4KKg4X/4boXLqkpvecfDkIw4Jmt5Mn/dOIe8x4XTkHnSunonMSr4tjcXVjlB+VUunJAsx/TrzZUM3i6tFKWjpXEeicJSmQxVWi6NxxyonsSPk40+x2Ei4n/l2hc/6et0BHSHr+fSHGgnC5vCN0zrrMMWYWYMGj578WBUvJte4EndM3FkKl1EcU96PF0zMV58gvgM7VarWmYUGRFIAUICg1ojShhhSDK9pC4TZIz/9ZmLFAc9nTUMtM2MQmUupIaVClLioNqlhIMbkStwatpnPi2u/eIuG2iNFzSNqnPDJkXIMuis6Bw7PF+rD5eco1+QxiW7dM53Rz0S5s4tFz7om5SLGP/Xk6Z2Wic2VE52pGo9GwMI8JKQAqDaxYUDHmFf95ntk4UTBredIvBA4m3sRsmDXYszpsK1Pq0YopKo0axkOgc5VsdA5nosPFslCJwLLwpEJI3Oat0rnFwm0JrckjWP6raFjsg9ukc7PFYcELZ4WMEyVpn4KFYFnEibYXdqHS5l+XYi0lZzRcyIkgLatRFkcUICoynTNEpeYfLUTkiCzHiWDUvdZgExGLM1FbMYtTKw2kmByGIEGLdI4pSXRu4hXQ/OWEXCgOSdBLeqQwhs71CzAWkqBXC07QSOAYoKgdIpnI/4lXROvxs4QF0zkiXm0Ba4mOLSBBgbFFK8JW6IaZ4uYVuNgzDY9mY0KKIrbAoWLeiQX9euHkjIUMFf97CbCU2hv5JxZy8ha9UVTjUSrqflbU1USxZ+GNfUumc3ohaQhJAQvQKnH13LDknOL2F5t8EgR70VJSdMndJ06Ug86R8XK93ohWgKQY7JXF5m8lQTuJlpOLSo6Rd0EEJ+jM8y3D50UZSzARtZyg653oOZfPJN6S9tk5vbfgnJwom38raA06LM6Rf5N0ztpfdPZJEhR0i1ltnZf2Rs65XPz8hhX5IAdQPsjhF0rWibl8tozoAnO0hZ7fCGb+0WMbotKgioUUkyv56NypV2zrny4tujg3SedmhfpQYC4FLqFx8U5vkM4V3von3YLX0KjYB0uhc6EHUJETnRZHWojgObrlDBhLC9C5bM+3GAX7UClYn3/ydAnTLt5l+AFmBYtbkM75xTd+81O0ipa0PTyP2Adkz0jGh9sl3pKKzuk7WXzIsV2vnSxn/9NC8r/Jn/RQzZcMHLs/pHEyP50rz7O4CDqnp+Zyjuu5F3uTS7yTcntjG/7dmPu7zf6OsUS9w39sG15n53JyPRu1U++EbG8QI8m2cQY9q0p2VzFFa9JtVk26zapJt1lBxZ+mu1d2e3q9MRzSAiMFCrwomMychLINgbgnGn4uVyeP45JtVvi5XB0/jssVss0KK3noXKppOdebbSBITIPWRkGqSWqkkC+ibrI+R79PXsbvBx+GyByl2dDlPPdvgs5ZaSiu094zhkJPcY+EvkcIBS3pE4GKkdkZpWmLfxN0rrGfbC3edHsYdISBYZJ/Jv3CdFPoLreWoAgP/8p/XLjqcOIkxhhvpxg6F7+fyD9IaojTPhlKmFBtHhDmFdSkBHQirYVej9ve0DhOMhj3RF+AzkXvNQsrw6RVM7u0zVDhLiRgwe530E+TuwV/MzAUk1kT+QDuFaDIYGCuE+Z+7L3h3KazsJKVzoX3Kl4l3B13CngvaW/Y10hrCEKP/OGoTzUrb75qff3qWZPbD8TlMN6rnSPtBuhcQsR1j4c0kPAaYsweqKdQo5D+sKJeLPoK39D72v3W6r1791Zbr2rcGyEuCfsw+sXRuXIUncOwnMTeG3s6lKMA/gaE8GLyHvFQIvmRwqrM5v2Ve0S63zVpDEdfwUZsm9pX+cvasI1+ZalWIl+ap0rsONHpD7mvBBYAmuNnvSZgXWY5RXyBAUaNhcUjHpYqrXtUVj4BhvCR4SRuPOJdCrvmubXE7JovZ66xEM9x7W1284OgaNaevX600no3rvEQwmxFCLw8rIihWHAVs/ndKoPl3jeaBN0wjjW41/rS6Zwfl4jah0PuBKRL4Nk67sf6M8BjiuAmUhIX3+Q+EqCkrXBU7rXGPGvhuBvzCJI9s5ZO5xox5mofD7n/BLcfMMtvipFDsBtD/r/oOZLb9URYVp4BHpbQ+9ueslnO1C+UzpXDxRv1cgwsLm8n9Qzwc1foiBhuTRkbUzQlIVHx+A1EWLrPAKN/+Edi3IjBkoHOGYaQS5MVcKm+K+4+i7fUMQxwf1XqyLxziGMDUzQXnrUoHezNwSJ+DOES493DrDU/MxeGjeFOzlDuMPoiwcLdi3uK5DyM4cwNAwhrWZdjixBZMHtRM4d29kpiEm9JQefUsCBjkRqKOirA8gkQLEFEQuYwsnMxWzEN7RshE7U0ZmT0/aHSWs6WX11ZfU+8OncM1loBlm+BYEViwmEjPzPwVHkURS8IvuW85dHjGkcs+NhwT8WozkA+OpfBiZS/2zkesvTBEoQpwSIAIhiFKd50agFiKqIX7P29RS62uv7jeM7F0J9t1ZixfRrx0E5D3I7KlErgRBnpnKUkue7E4DeeWQKHZfU+4N2XHEeKtDwHBXbUrI/HdTRoNsDu31vr3W53vfXjAMeppmGN6002Mh2qmKZ3uWw6p4blDLAoIWQWCRYOCMNE6D+LwWJ2bo6/W4fyXaWJcfn+9aNW6/X3CBUTWG9W4Vuvn2nBh5Ve5E70JdM5SzUJ5RwNmbUIvawJsNTEvCJnHoNjI73S/Hl9lbjNP1CMBb1BtVodjLHtVFbIpVdeacFlVTVBcsCSis7xXKaExZ4NhVjQNPGcTr0uWMs/yIpevW42OYMRMDLmUYMG8YxF2fWA1oJagK7O8nX3jRZcKwGWrHQuvQxVsLgntEfQRCrY8rHwpLrKXns3bgoZxOCjIsm1UGT6mqfkVcCRM+SBIxogYS9SPOeIw14myZyJVLHFu2S3H95jgWFESesZCOUd7jxUg8YiENsVNtbEny3zbH1v9U0NX04Vc93D1HX+aSZKw1vErRAqa2lv8/veCgMxj4tFweAhhlM9ChIPTKTvgrGAZ13hcj+Q6KKKud7h0umcKtpDWCjf/7kbgmFeYKCRzUUaOdIvzTciLK9qJg/nMiz3NAzuULEMnBcWad89U5o0xdeEFK+CxbuiN1u6xypY3jQNtlzGeb/gS2bIWl7xiax5a7lHYq4KFkznKnQ2oELpnFAYgSnUiTKuE1kqWGxq3ilhqTH2ShmgCAhRm49FWL6rUXOCEmUtpmpywbssL3lnq6UaE3nbkfdYDQuLnyIQ3KHIyEHoexfzHooMnfQj8k0QW1TWwieoU1WhzzE7p4IFhVziEFJEUMESUDDK9k2em4UhkkBbcPZiURl+qQtvrdyvxTtRo1wsnSvP0znlzhCHMTRwPzkTrZOUymIK/Way6EsC648sQ6/82BNRgQ72iGGMeQtK0Io9/G4j8+xcxjNrDFW1lv6Y3mTwr9ZKvL2srrS+peNGNt/Chw085oDB1wH5X1n/Fx4SAtAM1lrHdDy90nobBGMFb3FGgHcxnZL92CbF6J3Agq+5+1NrhQkHqMtfbL0biKxWHDMbBvcniEv1q9ajlZVHra+2MPfXnt1//OaTHooyYPATemu91X3bC4xNMf3vTOfyyBLonBbtRM5oAGhy7a09bj2iwoNml73W+mmLzZcwzzGotfCVaKQM3v7zh8//+f0Ap5/K65XV1dXu+id43LiL3nr3eK1Ho7XimXv7+fJn5zTFgky/A6jbg8Fa9fvHgbxjsLyjL31fXRsAeU5OzEOcs2EoertQemTMTLPP+n0SscfwrTFfGRkrYNnPW78lPZ3TjlWw9Hj83N1ao/KKjaAfs9e2BuyToh9Rx+ZrjMLYEMWVr3jIZstE3LJMMIie/HdPtMx0Dq27ykXOmWLpQZHzhrBcq+Jz/equEBJ66D5iYdl69Q19adxjC8gMGQ4CTUum8B8jPKjQhLeCKAU60dbi7cwtrPMELSms7mMCbylz3sKnhRXExT6vstlD4SZHTUPR+8vAEDiLsIoWjI9YPNbeCaisV4QgHXwbnysG0NvZypbmenZOMQXmvodhlLoAx2VuLpcDx0JLYDQmQ4ZZAI02Qb+10PKZwYDBxjI4j7xjzsgv6Nm5sorOwVSmR98S+2FnwB+DonFzfi5XDB1ioBVjiSnhwQcIIVhYjCYfrm+9jPRvZ+pnf3YuobZ5WFFMgTkXna0eDxi0X/I6EbcWPtXNxzky7zU5xSJohq1F4jpg0PklsmX2npH+ycBgx0d2Oqecn+tUB8DgwJDbLFjLt8Bk5sIA6ilECFN0lCQttq7Q+T1ma40tVcQ91RR0LmadKA1vkeicpiiu4J5XUXQRgJGtZeVbwCyDMROzuhUtu8DgA0hiE9prcbFVN2RrA9XquRcNy5W2HDonw6KIuc4vnWpV8gocB9m4MRgBs85g0ND6RqRs9Yx5ERdbuz82pXAM09BW59do7+5reWHJQuc0X7F250BYaNRl4RSNG7ELrbBnDFjeMcF4SwULRJhZCv18j42nu61/AYY8vmBvq6rwIXuG80guOoernQd7KKyQMreZQjHLbb/sQDcCFJWgybvv4LgRjhJbj4VHL4Lo0otBhSIsxG8w+KrVRWMiOGbmDok/Al2oGp2HSt7Emt/tEtr20gxOFwpgiOYt5Tg6B6PTRDET1YfmsjXmfkRu49o7NG5sPd4SX8WJtxcDCrzSLjAZhoTXgcHjR61HrdYPWz1D+jXIGTsvoq34bBjaJLUMOqdrTcXcgvuyQ4OCSLLW3sLh4dbaLg/GJPGiO1ztKGQN40LjB4tF4+rbx2+rA+FXmBgVaHYvo2+WMx2GAmZGOhdRpSFE51AuUxYpwXd5DIQmQxls4dGhwPXw270q7Pq5048U532AC8s2AasDKHkDChYdsUNUFJGl5F7X8uxsTTizJqqmR021Kw8nI4yLeJtBbzDYlUeHKK5gW1EYPkwf+EoDgZzIIvE4hMovqvWrjZjThZTl6HPQuYr6rAP3fdAbGg3EDrEhD85BGJVflU+E2wThKp+9o0mJBWLyD/SgXVXX3iviHRwQKWr1LE7n5hcRYsoTnmM/qgbGwWZO6P/oK+gGq/uCEUaBCsoYMDjYdC+PUQbYJdlMCe+etXihkpTl+CzlM7DOiHQmmGgyODg8CRnEVKprinkAeqnzNXIlArHJltkEawG96lasM6K5lgWqK2ehc5UYLyo5Lzo0vxpAQsPkoOCurFUT9msFuFBghEGSQUEZEFPpfFA+0Dfy+ZNvWegcKXIORVLCNU+kUieaej+EzXCpwu5QD2BJo7dLQIG2klR0y+kHuEBgxoY8oQevZAbwQlQulCEK7faNKUpTExWLni4ElTx0Tout8mm/qK5VGTJjBA3hHKAxppjArpwnV8R0SucddqXq7tgIpvdAzYRX4pdS2gp+IjdLFXptEToHZRgTLIXeVNEAuTrAglUqnZep6gHYD6UrbZErDaQrnccczmcf0DiZg86Vs9I5GI1iN1u5Dztr1RjpVC9SVn50L6qduCtVOw/jjgDChQRyFSrJROeYolxzDe7S6Fzdm7XOy/SHutr9lzEQd85fxO6FOxqqi+kZSiUnncNK/G5ox/2gAGat8/5FpiKh7uh9J/JSa53zi/gTC71DS11JW6RzlcVn5wJ/TDrVCwLzMtQd+MLDF5kPX3RHD6sRl3r5IeFKTr+gMsJZjrJNLMTt2KWLl2iIjFcS0bD4/NcPTpbSK/xKzodfzzvCpaovL/qJ8Honix6WkYnOlbGSpkCUY7ulDxcPkfz64YOTqRxN6ErOiw+/4ktdfCilulJf2L+Qi87VgmN1sNJIV4g4btOk1CHHsaE4Cxwal+9K7nU9Vclog/ZeUATeUs5A5/DyYtH1xAqWvp+hCj1SijkVYvFjVZYqaA63iMMyMlpLWU8qQnGrglaeF7AWKaSkOUChToucN4qu4ViotHfq8SdcKI66CGILyUTZ6RxS6sUUb1+G2M+HJAEJdE5+9DqSzlUWmZ2j/mgVVqe8cHF1OWDexOwcC1Npa63duHgn1lLPPot1orIeXzjl1gSdrWiGnCjFmIg5UYOeDtZIcUxYff6YMO3au20IosTbrsWe4xZ/oBtU+HxL9BnBQYKOKnJO5qOKOKOoaPGuQy5ww0fZGgWcaFW02FMpYN40ncNuqMfWH7oVseeOss1N5+jxpvI5p/VIpTF3vKl/cMfCbvsSN1E+iDb6/FnC4sSDaJtEybVONLcBv7DjRAoRb4+0LMhEOScWJHvLfmYrgqXm3TYUgtgXGnkUe/l0LmkjW0wFoJsW8qRcQbDkpXNBUrOu70zYdbdpy3LROTbFneP5lrAyXOi0+QKlfQoSqtCDuMda+PMteZ6GEhQzQPj4TqSjs0tu+bdK50walo7uwNxLe38+TmrawnQuy9J8GJZazFLwDQlKzVGw5FmaR2fwoOc3oG1Yel1SGkghj+NauNp5EymWpJhQQdXOm4Z527h4M42eJdQUFZDyQQ6dPsihF0PnKHu6XT9q74UadLt0DivmLceX9p7QoJuhc2lh0aa3lo9QtC0clgXpHGNPfmIZ9WWhchLdILaNKOsDqAl0TlHbPKraOeF1t8F3nfbpMIHFpdt0Fk3n0uxVVNA5ZnG3MP1i97fD7bgjdI7Fp9P8jyXkE3daI+0oS+0onM7pcXQuERZQHt1o4D2b0XYkwpJt48zcrnkrpIi75lXVzg2u+AfejYHiuBNf1Q5dJ1X4dLzNal7B6ZUqwTarAAYIC3HDQugcLxd6mO7ooMXFG12FynRqd43Ocf/bnno3gcrZfoQDaHeOzvFW+NeZnxzMLG7pcrhUWIqic0KStzamy03Vjjfzy1HJVYukc5HVftR0Dp3WFmyVM+tk70U9lWIyhfz8vAKGk9THtuUQ7wgd95OiHbmUvHSuoqJzgunp9Zm3JGBchySgVO24E3ROjE/+xnGaU9syg+LuNSwr1I6bonN6HjonNUfXNqZnBQNjn83q1vx9ygZLliqF+dagY2AJJgtPp+0CXcltz2rSUZGsHWUVLHkmLYkbFkznJBqlD7eP28WMBxzP3rd8Ghci2yE3SDossmg6l8bw4h3xai/lmZlxYrdHE8JJYh1Au7t0Lhyf/BPoSwsg47juwWmKdtxxOheq/g7T0v6Rl4/7Oq43PbEs1qDY5KrF07l0tbiji12aCUqGqpmCAoYQmbOMJM+xvfbxiTUES2iQutRnxsKwWehcBI3SLd84nHltN90uD8d2z/qzieXr9WLbcbt0jity2N64fj6yPddWg+Og47Wd0ewQ4OmexLhwS3SuWFg03fcrO9f705HX9lx0GjjaJeSQDUOu57Wdo+P9kx1oWrQd/y9gQc3RCT76zmQy2Ts4eH6AZbZ/cjLZCSWPm4bl/wCUi9SJRYHJEgAAAABJRU5ErkJggg=='
        click_button 'Add Category'
        sleep(2)
        expect(page).to have_content('Video Games')
    end   
  end
end
