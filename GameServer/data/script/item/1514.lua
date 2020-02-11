function OnUseItemEvent_1514(uid,thisid)
	    if s_deleteItemByThisID(uid,thisid,1,"每日2折（2折）") ~= VALUE_OK then
			        return VALUE_FAIL
					    end

						    s_addItem(uid,19004,0,4000,0,"1-1","每日2折（2折）")
								s_addItem(uid,19003,0,1000,0,"1-1","每日2折（2折）")
									s_addItem(uid,19105,0,80,0,"1-1","每日2折（2折）")
										s_addItem(uid,461001,0,1,0,"1-1","每日2折（2折）")
											s_addItem(uid,461002,0,1,0,"1-1","每日2折（2折）")
												s_addItem(uid,461003,0,1,0,"1-1","每日2折（2折）")
													local gold1 = s_getVar(uid,123,30)
														s_setVar(uid,123,30,gold1+1980)
															CheckVipLevel(uid)
																
															    return VALUE_OK
															end

