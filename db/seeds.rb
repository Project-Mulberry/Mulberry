# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  {:phone => '1234567890', :password => '123456', :name => 'Marcus', :gender => 'Male', :sexuality => 'Heterosexuality', :birthday => '01-Jan-2000', :location => 'NY', :education => 'Bachelor', :career => 'Student', :height => "6'0", :profile_photo => 'data:image/jpeg;base64,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' },
  {:phone => '1234567891', :password => '123456', :name => 'Zhen', :gender => 'Female', :sexuality => 'Heterosexuality', :birthday => '02-Feb-2001', :location => 'NY', :education => 'Master', :career => 'Student', :height => "5'9", :profile_photo => 'data:image/jpeg;base64,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' },
  {:phone => '1234567892', :password => '123456', :name => 'Jack', :gender => 'Male', :sexuality => 'Heterosexuality', :birthday => '03-Mar-2002', :location => 'NY', :education => 'PhD', :career => 'Software Engineer', :height => "5'8", :profile_photo => 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxQUExQUExQXFxYYGRkaFxcZGB4iGRkYGhgbGBkXGyIfHSonHBsoHBscIzYkJystMDAwGCE2OzYuOioyMC0BCwsLDw4PGxERGy8nISQ5Ly8vOC8vLzgtLy8xLy8xLzAvLzovLy8yLy8vLy8vMTEvLy8vMS8vLy8vLy8vLS8vMf/AABEIAOkA2AMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAABQcDBAYIAgH/xABIEAABAwIDBQUEBwUECQUAAAABAgMRACEEEjEFBiJBUQcTMmFxQoGR8BQjM1JyobEVYpPB0RZDVWMXJDRTc4KSovFEVMLh4v/EABoBAQADAQEBAAAAAAAAAAAAAAABAgMEBQb/xAAsEQACAgEDAgUDBAMAAAAAAAAAAQIRAxIhMQRBUWFxkbETMoEiodHwBSNC/9oADAMBAAIRAxEAPwC8aUpQClKUApSlAKUpQEf+12O++j98330Zu6zjPGs5ZnS9b9eeu0XYxG2npdLTjqGnsM7MJStCQkhR9kShXFygTaSOt2N2mu4ZKG9rsqRfJ9JbTKCtI4kuJF0rGpAF5kJAg1Fk13LZqI2hvJg2F5HsUw2vXIt1CVQdDBM1l2NtzD4lOfDvNujnkUCR+IapPka8/wCytltrxWObxbRW8nEKzKUJKlFZKSmbZiQSEHhdByyFZSTdBKz0BgtuYZ77HEsufgdQr9Cakq89Obp4FcfVZbEyhxQEKJSCCo+HNZK1DhV9W6BZdbOAa2hgsqsHjlqQArO3iJKIQYKoIJbCSQlxIhTZgklBC6jUidLLI7Rt9/2ehpKGw688ohtBVlSAmMy1HkBmHTU3EVGbmdqjOJcTh8U39GfUYQFGW3FaQlXJROgOugJNqq7fje1eMxOEGIYLDzGdt1JJLZzRlUmLgG/W0EE1+4vZ6XUlBAJMQCROYjhKVCwc6EcLo6KtRypkxhaPS9KofCdrOIRs9LFjtBLqWMznNEGHjOqgRkM8yFHpXb9mG+jmL7zDYrKMWxdRTEOtnRYA0IJAIgRI0kgWKUWDSlKAUpSgFKUoBSlKAUpSgFKUoBSlKAUpSgPyuR3g7Rdn4N4svvw4IzJShSss34ikGDF41+NdfXnXtE2QrB7SfceTLGKVnbdIJSFHxNr8gSbC4GUjpUMlK2dB2p7zbOxLDWIwuMQMUwrMzCVytKvG0oZLAge2IsQbKNaOxtsJfw6VLbCUlAzNrkICW1RINyWEq8K7rw5InM0q3OJwDIMhtE2ggJJvpfRU8josW4VipHCPhMZTAkKEKiCOFKkqPhV7IWR1bcBBBqjlZrGFH1jt12FrU41nw7sk5kSkoWkSrhTITYypKOUON5kSkaKNj4lGJ78vqdJAQsOpzqcby/ZuQo97whKhB40pzIJKYGziMXliLRYQCmMpmANUBKr5PE0TKSUGK/GdsBQhQ5RpYicxMJjhzcRSmMquNuDKTGonQuSZRiASFSbkHxBRlYypOY8K844UuHheT9W5lWAoyjJCQFTEAEEEpjKciVBSrpCScgUu7RJaeBQQa5ZzFhXvnoTK/FbRWb2k+F0cQyrBn8Y20pByqKiNQQZIgZQpJV4jl4eIcSZbcBABSslqyX2nhGlFJW2gluQmUlOQJ8SREqbQk3KRKmDCk52jAiMWxAgaXEECb8SkwLTHEUDhUPrGzqB+v7QsCCIsQUkgQnwlJN0hPskypuSg5kEVGrx3IDyiIETIEDwjNeB4VXSQDFQ2SkRu0ApeIZcjMUkBaggKUUpuFKmzkJtJvAEmpXZOP+iYvC4xAhKHEtvKSSUdy5wnMDcQJidYHNJnA05KpIjnOgkHUkeEz7Q0N4ua/N4MOksuym8fhIUIVysFQJKNCOJJ1qU90VlHZnqGlQu52PL+Bwrp1Ww2VfiyDN+c1NVqYClKUApSlAKUpQClKUApSlAKUpQClKUBUPazvZtDD4xrDYZ1LLbjQUFlCSVLzLCk5lAgWCekSJImq42hg33zmxb7rxE2cWqEkeKE+zl0IGkzBF6vrf8A3Na2iyEKOR1s5mXQJKFGJB6pMCR5A8qo/bjeK2epLWPbMn7J1tQKXAiAIOoKQbKspMxBSYFZX2NIOPcxr4UhIAAAiOWmnQSNRorUXrEgr5efxi/qY1HMda/X3OnwiPOI5X9nQG41rYwhEXt115X5XgdRxI1EiRWRuay1LNiOn6cPrbQ9LXqQwWGChBEgxzGpsmCbAk2So8KjwKgwax4p9CASswnmSNJvcDWbG1lWUiDas+z8W2u6FpVqCBCjKrEEGAoqHIwl0WOVYBMkWfGJ2MUiQeGDe4EBUKmbpAVZQVdtVl2IUdf6GpJvNiZmRp4p5gi2bmLKuL12eAdSoajkZzdPq0qCl8/YS4sf5LwIhVYcTggmTYAD95ISEGJvKm0oJi8rw5MHO0qQojUc8vZhcEonNN0x4zExA/vct4TZxPEiSCmv3CbPmIHSIgniHCByUVDT2XQCBCxFShbCSbREpIKY8PGUlKTaPGUJMps60SJFbScS2o8REmQSQFTnuQoCA4FakJgPeNGR1JClCyOTs20jyMg2icoIUrlPCFq0P1boFlVo7YwKgy4ItkWCIIhKfFwm+VJ8SDxNEyJQZrrkupmxzGRcKSqSsZUnMeFZWmyXFQh8fVuBLgBrHikJKcwgAAGZKQAg5ArMriQEnhC1cTJPduBSCDU0Vs/exHfdboa2ctmAhlakO5jKocNojSCRIOqPO1yVSfZYlbm13Srw4bDd0kZcuTM4FBGX2fEuwJANhaKu2tUYtUxSlKEClKUApSlAKUpQClKUApSlAKUpQH5Xl7bb2If2hiDjbYlKsob9lCBdKWuoggjrM3Kr+oarnta3KOKQnFYdIOKYE5Y+2bFy2YuVC5HqRzBENWi0XTsqHLlIJuPK9uRE6j18wYNbmSACOkggmIHMHWAdDqg2VIvUc3jA6gOJm8zOoV7QJ5nS/MEE3rM26UAjVJvH3TFlDoY56EdeWPB0cmxuzsj6djAhd2WQFuDkSTwoidCbkC3i0qwNqdneAeuGu5V95pWXXS3h98eRiozsiw0YNbvtOvKV55UwkD45tOsVKbxb84XBL7palLXqUNgEonmZIAkezMxy0NZylLVUTSMY6dUu5AYjcHGNEqw2NzXzBLqOcZVSYVMiyhF9DWFWC2wmEhtpV7LS5ATAhs8SsxKBYHXKShWZNh3WxNutYpoOsrzJmCNFJUPZUDoY/I8xW6b6fD+lV+rJbF1hjLdFbt7l7Qc+0fZaTYANpKiADmSkSBASZKQDwyQIFq3MP2YtGC/iH3eoBCUG8kRxQCb2NdTt7bzODa715UAmEpAlSzrAH89POtPdvfPDY0lLRUlwXyOABRHUQSD5wfhTXkasfTxqWl8+pyW1dmN7NeRGZODfBRJGfuXCADmSftGVgDMg3IBI4kJNThKkpUVGICVZg4DMjK24lw2VKeFDyrOJll4TCqlt9NmjEYJ9rnkK0fjRxJ9JiJ6KNVg5vA6cEQFJX3iSkJTIUlxfA5kERxDxoHCqQYm42xz1R3MMsNEtuCzewbAyzisWRHfvZUWIHdtDhgSYEqUIm2WOVWrUJubsYYTBYfD822wFeazxOH3rJNTdbnKKUpQClKUApSlAKUpQClKUApSlAKUpQClKUB557VUYfBbQPcrSUvQvE4cT9U4dHUmISpQOaBfWQUqAqGKQpAUhWYEHKRY9SB0VzKdOabTXc7rMIdf2utxKVqXi3WlBQmW0EhKSDYjy8h0rj98thDA4hoYdLimsQFfVJlRC0ETk5kjMDB+NxGLknLSdEYuMVLsdX2Zuq/ZQDQSXEl4JBPD3klSQvoLp91fuwuzFtuHsfGIddOcnMe6ClSVAkRmVc3Np5c62uzPY7rGDIeSUrcdW6UHVAUEpAPSyZI5SNDUZtftAxSnV4XZjPfBNnHCkrTmEzlEwkAiM5MGLcic1blJL3NWqjFv2J7Y25ycJiHnmF5WXEAFiDZxJnMCTYATw/vSLRHRITOnyf6/r61wu6m/LweGE2g13Lqo7pcFKV9Em55+FSTE29e7IkynXmn73oOvl7x0Gc073NMbVbHO4/clvF4wPYhwLbQ2EtMGQjPmklRm4PpcwDpB5/eDs8DbiX8B9S+2oKyEnIog318NuXhItzmm8m/T6n1YbZzPfOIP1jmUqAOhAi1tCpVjGnOt3dnfd5b6cHtRruXVwll7KUhZ5JVcgybBSTratEp1/fgzcopu1t4+DOtakpGYAGBmA0mLx1FUTutgsS7iENYcJUcKtTv1hPdZkrlGYA34tB5q5TV9ONlCiFiCNf6+YriOybCpGFcfjjfeWVH91JhI9ASo361TG3BSZfLFTcV6lh9n29Jx+HK3Eht5tZafbGiXE6lM+yRfnFxJia6mqz7MBG0dsJHhz4dURAzKS4VGORn9KsyuxO1ZwSVNo/aUpUkClKUApSlAKUpQClKUApSlAKUpQClKUBUKkfRNtYplVm8YlL7R5FaQQ4n8U5z6Ada1e0fg+g4jTucU3J5hC/FfocoFd12hbqHHMoLSu7xLKu8w7vRVpSf3VQPeAbxBqnfPbGJdwTuHxOAxDb6cqlrS3LAyKClOBQmEwDpIvrWEsb1qSOnHkWhxf4LNVY8+nn0r42FsbDtNBrDNhoiSUgk5zrmlRJKvU6W0019k4nvWGHRo42hXoVJBitlKxNjca9R/SuVNx2fB2NKSTXJobd2Uy4lKsSlOVpQcC1HLkKTrMiB1Bt1qLRv7s8ryfSUgzrlWEz+IpgfGK6vGYVrFpSh5KVEKCgD4FqSCBnGhImRNrDpWk7sxoDIphECxSUJj0iI+edXelLxRROTfZM+dg7Hw7TQRh0JSFErStJJDma8qUSZN4BmNBa1YNs7GZxADb7ebKoKAMgpUOhEEVubMw7bKe7bQEIkkJHhTJk5QfCJJtpcjTSQVlcEFQCgLHyHUa5fPVPmL1X7t09yft2a2Nbbm0kqwuIU5ZTbLq0q65UE/G2lctuAlLOzGFLOVIbU4tRiAkqUsknTQ8/SvrtJeLWAxUiCUhEfjWlPvsZrT2duJtTEMtYXEuss4RKWwssyXXEJAhFxAMamwm8K0raMZTjv4mMpRxy28Nif7FsMpTGJxqxBxeIWtM692klKfzzj3CrHrXwOEQ02hptIShCQlCRoEpEAfCtmuo4m7FKUoBSlKAUpSgFKUoBSlKAUpSgFKUoBSlKAVp7WwSXmXmVeF1tbZ9FpKT+tblKAqHsrxqjgktL+0ZW40tJGmVWbKRzSAoDyiRzqYO7Ab717Ar7t9a1OOhwZ0qJJIB0VkEkDKbTcGtLfLdN/CPubR2aCrMc2Kwt4c5qcb6L1NrzMTJSdvdzeNvEtpeYXp4h7SFc0qHyDrXLNOLb7M7MbU0kuUQ729WKYticC6QIhzDkOJMXBgwU++tdfajgzZangdClTZzDyN9a791oODMkQv2k9epT/T5MfmPnWUmlyv3No6nw/dHMYfetx4xhcE+q/2jsNtxzVPEVWvAE+VSGH2LLjWIfUFYhsylTYypQCkgoGqlJ4ieI31hNxUtNQ+828LeDbSSC484crLKZzuLJgAAXAmL63AEzUJtuoovJJK5s0u0pwPjA4O2Z/EtAp590PEPwSoHygx0FvVX+4G5jjazj8eQ5jXBwp9nDoP92gaBUEgkaSQNSVWBXbFaVR5s2m7R+0pSrlBSlKAUpSgFKUoBSlKAUpSgFKUoBSlKAUpSgFK+FrABJMAXJOgHWuI2z2r7MYUUB4vLFsrKSu/QKsk+5VAdzVLdqWzTg8dhH9npyYjEl3vECA26W8iuJNhmVmMm0m9jcyv+nDCf+1xcHTgR6f7yoRW9DW1dq4ZbAWG8Oy6ohwAK7xZyEWJEXRz61WWydl8auSSOg3S3tbxVhLT6PtGF2WgjUiblIPOJE3EV1TrIdEpsvmNM39D+tchvDuqzilJcOZp5PheaOVwdJ6/MEVGI3d2hZP7VWEjmloBcDTizTPnNcicPwdzjNdt/H+SQ3m3mRhSGkJLmJXZplPik6Ff3U/rB9RGdl2z3VbXxC8blcfbYSoHUNlZTCUTpCSUyOp63mN392WcMVLTnceXOd505nFTqJ5D9YE187oupb23j86kpBw7SpUQBbIOdq0wuN1Ey6hS03ItWlQr29mBQYXjMMk9C+2P/AJVt4HbWHe+xfZc/A4lX6Guk4zfpSlAKUpQClKUApSlAKUpQClKUApSlAKUpQCsL7qUJUpRCUpBKlEwAAJJJ5ACs1UX26b6KWv8AZ2GUYkfSCn2lGChkR8SOZgciKAht9t8ndpOKCVKRgUqIQgSkvZT41n7s+uW1tTXNJISMqEhI5wI6a/AHoDcRX26kJAQnQAARzi06CfWAeR0phk8zYC5MxA6zoB5m3WrpFG7PjFLLaRlBW8s5UJiTPtGL3AItYyUqBN6+929oqwOMS4lJeHdnvsslWQqlbgkDSAq9o1IJJGLBHvFKeULXQyCLZRMmCT18IIKc0psKn90nI2lg5uFIdRdenCtREG6D1BkEmRY1lmlpxyk1dKzTH9ySLTwGMbebS60sLbUJSoaenkRzBuDrW0BXJ4/cpbbintnPfR1KJK2lCWFHnw3yHqIMezbTXOO2ynhOHwyj98LIT5EjPJ91eV9bE91JL12PTU5d1v5HZG2touTyjrPTzqkt/XmsbtBX0daVANhOaYSpaCZynmIIuLWJFq7de7uMxX+3YoBv/cMAhJ8lKIkjWxnyrnd/tmt4fEYRLTYQ33S0hITPhJUSTrmvJUb8606bqcMsyxwdt+HCMup1uFtUv3OXwWzmyVNON5HkWUjWeYUi97XgagyDoD+vbKRqBHMEE+4g9Oh91jas+PbWSl5riUgEFBvmbFzHMgXkC415SH0nvAFJmCJvr5z59TziTXrHms6XdDfrG4E8TisTh0/aNLMuIRzW2o34eadI5DxD0BsraDb7TbzSgptaQpChzB/Q8iORBFeXAiPEJBsQTHLryMaHp1Fdf2K71qw2IVgXiruHXFIaUrRDwPgn9+wj72Xqaq0TF2egaUpUFhSlKAUpSgFKUoBSlKAUpSgFKUoDnd+t4xgcG6/qsDK0n7zqrIHn94+STXmZxglxnOc7rjpcdPiUVWUcyRCouZv960irJ7Y9r9/jmsIDLeGT3jgsZdWJSmDZUJgxMkKXFxVfbRd48MTxcblism8I9FpVoZJg2IvNSkVbMuIurrN9Znzn2vXU871r7RUQlLaTxuGNdE+0Zkai0gwoZgbipFzDHMDqlUqSq8KA8RsNQfFAChqRUbh5cW49yByIuNPaJi0nrEK4udWZCNkkABCdAAB6D1/Q3ExMVJbBWRj8Ab+NxIsPuxAUbnxRkVp6KFRIrZwTkYnAqtIxDQOs5SpINtFCBE6jQ8qzzK8bXk/gtjdTTL4Vp86DS+sDrqnQ2rVdVHz8x6e8Vtzb4HX3Az+QVz0VWo9qPn3R/LlXxfUcbHt4+TCTVf8Aaqkd7gFWF3UyTl5NxxctTBOnO1WQGpE/Pr6efLQ2rge1RshODN5GISLRNxpCrTbnb3Vr/ioyh1UW+9/DKdVUsUjiUqKVc7H0II5+Sh5fnWvg0KQ4GbqQuVtFPjQRdWUe7w84EXvWw+jiIHK2kReIg3Te0HQ2mozacGEJJU4DICdUkXJPSwM9Msmvs2eKicWAUxaYMRopOpKOqZuUapNxzSIrZ+FLjToQEBxTpLajwqBSQRlUbASYsQRN7REq4gqF1ZlQCqPEFASTA8X4kzmTe5kCN2GYZT5lSiIMG+UEg25RmT6GgR6M7N95DjsE26uzyJbfTzDqLEkcpEKjlmjlXVVQ3Y7tYYfaK8NdLWKbzIBMp75uTwH7pTn1vOUG4q+aoXFKUoBSlKAUpSgFKUoBSlKAVrY3FJabW64YQ2lS1HolIKifgK2arztv2uWdnKaR9piVpZTGuU8S/cQMv/OKApf6et4vYlfjxDq1kTICZsjW4HQgKAyqFau1R/s6rwHCnwyOKJGYXHmg9ZHirMYEJGiQEj0Fhr+huNK19rGG0KtKXEHxEHKJ0PMTH7yfQ1fsZ9yYecUG1o1SsCZvc2Q6k8lckujXwqqHxeBeaQnu3A4xcNkjKQTdTahJyL5lMkHUEi9dNicLKdDMxoJzKGYiNO8KblI4Hk8SYVIrQ2c9klJSFoXZSLlKxqMvPMLkCytYvIIk50Y8p8aFJ8xcfGt36QPqHBOUPNrnlAJuRqDaJH8hW9t7DhphbjSszbkISTBIKj4FCIJyhRBEG0iIWlOrtrhwqWzlIbyZCRcH2si0cKgZmDYji8WaayVpomOzTPQHz7z+Uke5Q6GtR35+eY/MaGthlUpB6jp1uRH5lPvTWF/5/rPP15+tfE51+k9vHyZmD8/kDPXlOh0NcR2wtD6K0u3A+g3EiIUIjmL+E3Gmldsx8+/9SRy0UPOuR7XEzs9w/dW2qx/fCQfMXgHUaHlXZ0Mv9kPVGWbiXoVZtN4l3ukrypIzFSQrMoGxQmTIGWRrcASJtX0wEoTlQmNJPMkaEn1uOkkaVm3hcUAh3OczapCVQrMlcTlWBC+s2mSdZr8eHMQQbgjQg8x5fNq+sPIZ9I8DhImEKOhIsDeBcQfaTdJ1EE1q7MENIH7s8+d5j01I5Qa+sQr6l38J5E+U2uNfFpyNjX7hRlQgacCeovlB53BvM6e407kdjM9jFMlp9BUFsuodSJ4SZEhUaEgC+igPj6k2fjEPNNvNmUOIStJ6pUAofka8tpMgiYBBBMcjYyOn86ujsM2v32z+5UqV4ZxTR80TmQfSCUj8FRIsixqUpVSwpSlAKUpQClKUApSlAflUN2z7Q77aLTIunDNyr/ivQctxE5QgxabxV81SnbTuslpaccwtQdfcQytk3S6opMG54bIvy0Ig6gVyk2+fn3Vh2nJZcF7ZTpOihc9PxD0OtfLjxSstvIU24kwpCxBB99ZMUAW1i3hVqY5TY/yNX5RSqe51mznAtlGhBTEZSRAGdacouUjxqaHEj7VsxIqJxiQFSdDqScwINwVlPiBFw6nxABVlAivnd7F/Uok6JEySLI0JIvlSbhwcTRM3QSKy7RVNxMgnkAZPEbCyVHUpHCrxoiSKEMh9oEDEMhZgZs5zEg5gJTJRqTbjTrIV5Vm2pJZe1uATBAJhQMkeFwc+GDMKFprZxWE75mAJWmVNx4gpPEcnlzU3ynOm0itJGILuGcXkjhUFwmUZ0iZy+xqDKfDMeEwBYvbYzuZhlXVpB/7QfWB8U66VkxHz89fyOtRe5704LCmf7pu+lwkCZ5X0Vy0Nqknvn/xy9OWotXxHVPleB7ePszIyPmPeRHMcyNeYrm+1FvNs7EeWRXX+8ReepHtaKGtxXSMn59P5Drqn0qG7QkTs/FD/ACyfeCFctDaY0Oorfo6UoPzXyUzd/wAlP7UWQ0EgEKeyJEoKdQFKJSApJ5eGCJSoamvtKUpAQLZQANLwIm1p8xZXMA1G4JwLWlQACWm0gQI4yLnra95kGOVq3Jr69HjMw7X+yX7uWnENOnvt+VbmIbywNIAEQREC4g3SeqTpqLGtPayZajmpaU6czJtextobHUaVt47EozGVpSkWiTyBIABlQFrAzGk6VPcdj4QuPn5/oa7PsW2p3W0nGCRGJakAW+salSf+zOffXLbI2U/izlwjRyzBfXKWxqJTNydDAkjzFWh2E7IYDDz5b/1tLq2XVqMlOWDlR90QoTGpHkAKuSeyLKDStlr0pSoJFKUoBSlKAUpSgFKUoBVXdo7nfbU2ZhtUtBzEOD0s2T6KQf8Aqq0KqLAu9/tjaWI1SyEYZB5SLuDzIWg/9VUm6i2aYo6ppErtjYzGJTlfaS4ORPiH4VC49xqut9Nx8PhMO48068kyEoazApUpZjKLAxEnmbValczjGPpm18HhdW8ODinhyJEd2D1vl9zhrlwuWqrO3qFFQba3Kp2I4Utp1EEjXRQJ05oUJ5++Qa2XXc1h6dOekchN40B0sYrLisOEPYxu3BiXk6EGAqPRSbaapmRIJrXZIn5/8H00Pka9BHlPkldnWF9ImSSAAk2JULpCTo4OJo6goNR28bSmXFrykNOpU27Eoh3KY7xKZCXIVNgUqClFNlWlME6BBmIgyFRB8IUFHQ8gsjnkcEEGtvaTIWw4iQAUKTZNglBkjKZPdoUZLd1sKMpKm1VDJR2HZ+/OAwxH3CPelSkn000qfUqa5XsxVOzWPIuDT/MUffr611KK+E61OPUTj2t/J7+HeEX5Izsn5n4GeXry0Nqid9/9gxX/AAV8o0EkRy808jcWNS7Z+fy+eR0NRO+4/wBQxX/CX8AD15D4p00rp6Vfqj6r5MsvcpLZzORtA+8Mx6X05wYFuRmRWwr5+ef61+hENtebaDoBPCL2sRyzC9oUJFfCK+zR4jMeLwanu5aRGZ15DaZ0zK4QJ6SRY+o1NWD2c7CwTuGbdOHQXkEodzgqIcSeYVIBiDEWmuV3YazbR2ckj/1CVefAQr0P6/GrCQx9D2zisPo1i0/SGR/mX7xKfMnOY6JT5VjnTcdjo6ZpSV9zpkCIA0GgH5Cofs3c7nam08Nol0N4lscr2cI/5lgf8tTEVzWOe7jbOzn9EvBeGX7/ALMHzK1j/prlwSqVHZ1MbjfgW9SlK7TzxSlKAUpSgMXfI+8n4infI+8n4ivG2HwudQQlIKlWAtcxp6nT1rINmryJWGlFCtFBBIuooAkCxKhAGpkdRV9BFnsXvkfeT8RTvkfeT8RXj5exXhl+oc4gSAG1EgJOUyIkQevUdazM7vOqRnyJQkqCE94pKCtUBUIC4KrKSbayImmgWeu++R95PxFVNhezrHNKdLO1GkBx1TqvqUklSjcmSfK2lU1iNgYhCilWHdnvC1ZpRBcBIyJOWFKsbCvpe77ycudrJKSqViAIUtORUjhXLa+E34ajQnySpNbour+xW1P8Xb/gIrodwt1TglYh5/EJfffUnM4AEwlAgCJ87+g6V5i7sdB8Kd2Og+FFjS4Jc5Pll5bx9lTr+KxD7WObbQ853hbKJhXnxQbzeOdRh7GcR/iLX8L/APVVB3Y6D4U7sdB8KtoZXYuAdjmIGm0muf8Ad9bH2ulqyJ7I8WNNpIHh/u/u+E+LUCwPIW0qm+7HQfCndjoPhTSxsXhsvs1x7DYbZ2o2hAJOXuUkSdTcmtr+xG0/8Xa/gIqhe7HQfCndjoPhWEukxSdyjFt+SNFlmtlJ+5fX9h9p/wCLtfwEVjxm4O0nULaXtZtSFiFJ7lNwRB0vpVE92Og+FO7HQfCpXSYlxFeyDyzf/T9y309jb4AH7QZAAAA7oRYAddYGuvOn+hrE/wCIs/wv/uqg7sdB8Kd2Og+FbaWZ7F6bp9lbmGxjGIdxrbiWipWQIgklJAvm6mfdXVb/AO6v076O4ziEsvsLKkOEBQyqEKSRPUJN50I515h7sdB8Kd2Og+FRoCdF+f2K2p/i7X8BFa+J7Osc6povbUaWG3Uup+pSCFJNiII+GlUXkHQfCvzKnoPhVViS4SLucns2z2f3yPvJ+Ip3yPvJ+IrxjkHQfCmQdB8KtoKWezu+R95PxFO+R95PxFeMMqeg/KmVPQflTQxZ7P75H3k/EUrxgEJ6D4UpoFmVtwpIUkwpJBSehBkH41Nq3mXMhtCYPABolByAtm2YiEC4Kbkm9ogqVoCUY2slKUoDPChSVIlZzAoUpaMxCRmAUtyRAkLGmWa2sHvOtsvKSjjdmSXF93dGTibBCVkXKSdCZvAqBpUUDpzvmuVEYdsFYUhfEu7K1rcU0IIg5nFcYuBHOSY/am3O+YZY7pKUMZu5hRJQFrWpaSSOIHMjXTuhGpFRFKaUBSlKkClKUApSlAKUpUAUpSpApSlAK2Nn4wtOJcSASJsrwmQRcc+vqBWvSgJj9vdcOxeJ+rF/CZ9ZTr5nWvobxqjKWGMsyE5OFOnhEwNJm9z6zC0qKBLr23IQPo7ICDIATAkpym0+8awoA30r9G3rADD4cQQZDcGREX1gEadLedQ9KUCdG9DoCRlQcqcoJkqHAhMgyL8E3BkqPKAMn9rHJJ7tu5STr7K1rAF7DjIPUTNzNc9SlAz43ElxalkQVRN50AH8p99KwUqQf//Z' },
  {:phone => '1234567893', :password => '123456', :name => 'Hang', :gender => 'Other', :sexuality => 'Heterosexuality', :birthday => '04-Apr-2003', :location => 'NY', :education => 'High School', :career => 'Unemployed', :height => "5'7", :profile_photo => 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmeRm2HdIiQDfpd6SXCNrFIGThwskb4-KU3Q&usqp=CAU' },
  {:phone => '1234567894', :password => '123456', :name => 'Robot', :gender => 'Female', :sexuality => 'Heterosexuality', :birthday => '05-May-2004', :location => 'NY', :education => 'Bachelor', :career => 'Student', :height => "5'6", :profile_photo => 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTC0Ne14kSOMWTkME95yrotH3OIRikEv7tMg&usqp=CAU' }
]
users.each do |user|
  User.create!(user)
end

interests = [
  {:uid => 1, :interest1 => 'japanese food', :interest2 => 'jazz music', :interest3 => 'chess' },
  {:uid => 2, :interest1 => 'italian food', :interest2 => 'jazz music', :interest3 => 'tennis' },
  {:uid => 3, :interest1 => 'N', :interest2 => 'N', :interest3 => 'N' },
  {:uid => 4, :interest1 => '', :interest2 => '', :interest3 => '' },
  {:uid => 5, :interest1 => 'spanish food', :interest2 => 'country music', :interest3 => 'chess' }
]
interests.each do |interest|
  Interest.create!(interest)
end

messages = [
  {:sender_uid => 1, :receiver_uid => 2, :key => '<1>-<2>', :timestamp => '01-Oct-2022 11:30:00', :message => 'Hello Zhen, How are you!', :is_read => true },
  {:sender_uid => 2, :receiver_uid => 1, :key => '<1>-<2>', :timestamp => '01-Oct-2022 13:30:00', :message => 'Hi Marcus!', :is_read => true },
  {:sender_uid => 1, :receiver_uid => 2, :key => '<1>-<2>', :timestamp => '01-Oct-2022 15:00:00', :message => 'Interested in the recommended activity?', :is_read => false },
  {:sender_uid => 4, :receiver_uid => 1, :key => '<1>-<4>', :timestamp => '01-Oct-2022 10:00:00', :message => 'Morning!', :is_read => false },
  {:sender_uid => 3, :receiver_uid => 4, :key => '<3>-<4>', :timestamp => '01-Oct-2022 18:00:00', :message => 'Wanna eat out?', :is_read => true }
]
messages.each do |message|
  Message.create!(message)
end

coupons = [
  {:name => 'food', :message => 'Both of you may like this amazing restaurant! Check it out and enjoy our special coupon!', :location => '116 Street, New York, NY 10000', :original_price => '500.00', :discount_price => '450.00', :advertiser => 'Fancy Restaurant' },
  {:name => 'italian food', :message => 'Both of you love Italian food! Check out this amazing Italian restaurant and enjoy our special coupon!', :location => '116 Street, New York, NY 10000', :original_price => '1000.00', :discount_price => '50.00', :advertiser => 'Columbia Dining' },
  {:name => 'jazz music', :message => 'Both of you love Jazz Music! Check out this amazing Jazz bar and enjoy our special coupon!', :location => '116 Street, New York, NY 10000', :original_price => '20.00', :discount_price => '8.00', :advertiser => 'Fancy Jazz Bar' },
  {:name => 'tennis', :message => 'Both of you love Tennis! Check out this amazing tennis club and enjoy our special coupon!', :location => '116 Street, New York, NY 10000', :original_price => '100.00', :discount_price => '20.00', :advertiser => 'Dodge Fitness Center' }
]
coupons.each do |coupon|
  Coupon.create!(coupon)
end

activities = [
  {:status => 'DONE', :coupon_id => 2, :datetime => '2022-10-01 13:31:00', :fst_uid => 1, :fst_accept => true, :snd_uid => 2, :snd_accept => true },
  {:status => 'PENDING', :coupon_id => 3, :datetime => '2022-10-02 15:00:00', :fst_uid => 1, :fst_accept => false, :snd_uid => 2, :snd_accept => true },
  {:status => 'SCHEDULED', :coupon_id => 1, :datetime => '2022-10-03 18:00:00', :fst_uid => 1, :fst_accept => true, :snd_uid => 2, :snd_accept => true },
]
activities.each do |activity|
  Activity.create!(activity)
end

prompts = [
  {:uid => 1, :answer1 => 'easy-going', :answer2 => 'geek', :answer3 => 'engineer' },
  {:uid => 2, :answer1 => 'romantic', :answer2 => 'music', :answer3 => 'student' },
  {:uid => 3, :answer1 => 'prompt-1-answer', :answer2 => 'prompt-1-answer', :answer3 => 'prompt-1-answer' },
  {:uid => 4, :answer1 => '', :answer2 => '', :answer3 => '' },
  {:uid => 5, :answer1 => 'honest', :answer2 => 'food hunter', :answer3 => 'athletic' }
]
prompts.each do |prompt|
  Prompt.create!(prompt)
end

history_list = [
  {:uid => 1, :matched_uid => 4, :connected => false, :updated_time => '2022-11-01 12:00:00'},
  {:uid => 2, :matched_uid => 3, :connected => true, :updated_time => '2022-11-11 12:00:00'},
  {:uid => 4, :matched_uid => 1, :connected => true, :updated_time => '2022-11-11 12:00:00'}
]
history_list.each do |history|
  MatchHistory.create!(history)
end
