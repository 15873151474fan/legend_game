function OnUseItemEvent_1511(uid,thisid)
	    if s_deleteItemByThisID(uid,thisid,1,"648礼包（6折）") ~= VALUE_OK then
			        return VALUE_FAIL
					    end

						    s_addItem(uid,19004,0,8000,0,"1-1","648礼包（6折）")
								s_addItem(uid,19003,0,648,0,"1-1","648礼包（6折）")
									s_addItem(uid,19105,0,50,0,"1-1","648礼包（6折）")
										
										
										local gold1 = s_getVar(uid,123,30)
											s_trace("gold1.........."..gold1)
												s_setVar(uid,123,30,gold1+6480)
													local gold2 = s_getVar(uid,123,30)
														s_trace("gold2.........."..gold2)
															CheckVipLevel(uid)
																
															    return VALUE_OK
															end

