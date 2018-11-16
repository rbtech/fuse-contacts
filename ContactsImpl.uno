using Uno;
using Uno.Collections;
using Fuse;
using Uno.Threading;
using Fuse.Contacts.Helpers;

public extern(!Mobile) class ContactsImpl
{
	public static void GetAllImpl(JSList ret) {
		debug_log("Contacts only working on mobile");
	} 

	public static void GetPageImpl(JSList ret, int numRows, int curPage) {
		debug_log("Contacts only working on mobile");
	} 

	public static Future<string> AuthorizeImpl()
	{
		var p = new Promise<string>();
		p.Reject(new Exception("Contacts not available on current platform"));
		return p;
	}
}
