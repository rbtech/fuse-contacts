using Uno;
using Uno.UX;
using Uno.Threading;
using Fuse;
using Fuse.Scripting;
using Fuse.Reactive;
using Fuse.Contacts.Helpers;

[UXGlobalModule]
public class Contacts : NativeModule {

	static readonly Contacts _instance;

	public Contacts()
	{
		if (_instance != null) return;
		_instance = this;
		Uno.UX.Resource.SetGlobalKey(_instance = this, "FuseJS/Contacts");
		
		AddMember(new NativePromise<string, string>("authorize", Authorize, null));
		AddMember(new NativeFunction("getAll", (NativeCallback)GetAll));
		AddMember(new NativeFunction("getPage", (NativeCallback)GetPage));
	}

	object GetAll (Context c, object[] args)
	{
		var a = new JSList(c);
		ContactsImpl.GetAllImpl(a);
		return a.GetScriptingArray();
	}

	object GetPage (Context c, object[] args)
	{
		var a = new JSList(c);
		ContactsImpl.GetPageImpl(a, Marshal.ToInt(args[0]), Marshal.ToInt(args[1]));
		return a.GetScriptingArray();
	}

	Future<string> Authorize (object[] args)
	{
		return ContactsImpl.AuthorizeImpl();
	}


}

