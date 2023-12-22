%dw 2.0
import * from dw::core::Strings
output application/json encoding="UTF-8", skipNullOn="everywhere"
---
{
	status: if(vars.errorDesc != null)"Failed with ERRORCODE ::" ++ vars.httpStatus as String else null,
	message:  vars.errorDesc as String default [],
	reason: if(isBlank(error.errorMessage.reason)) if(isBlank(vars.errorTypeFor500))vars.errorData.errorDetails[0].reason as String default [] else vars.errorTypeFor500 else vars.errorMsg.reason,
	summary:if(isBlank(error.errorMessage.summary)) null else vars.errorMsg.summary
}