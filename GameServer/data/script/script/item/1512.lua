function OnUseItemEvent_1512(uid,thisid)
	    if s_deleteItemByThisID(uid,thisid,1,"1980礼包（5折）") ~= VALUE_OK then
			        return VALUE_FAIL
					    end

						    s_addItem(uid,19004,0,25000,0,"1-1","1980礼包（5折）")
								s_addItem(uid,19003,0,1980,0,"1-1","1980礼包（5折）")
									s_addItem(uid,19105,0,100,0,"1-1","1980礼包（5折）")
										s_addItem(uid,461001,0,2,0,"1-1","1980礼包（5折）")
											s_addItem(uid,461002,0,2,0,"1-1","1980礼包（5折）")
												s_addItem(uid,461003,0,2,0,"1-1","1980礼包（5折）")
													local gold1 = s_getVar(uid,123,30)
														s_setVar(uid,123,30,gold1+19800)
															CheckVipLevel(uid)
																
															    return VALUE_OK
															end

