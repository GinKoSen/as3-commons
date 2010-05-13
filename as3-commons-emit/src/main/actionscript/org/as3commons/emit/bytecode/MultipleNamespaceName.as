/*
 * Copyright (c) 2007-2009-2010 the original author or authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.as3commons.emit.bytecode {
	import org.as3commons.emit.SWFConstant;
	import org.as3commons.lang.Assert;

	public class MultipleNamespaceName extends AbstractMultiname {
		private var _name:String;
		private var _namespaceSet:NamespaceSet;

		public function MultipleNamespaceName(name:String, namespaceSet:NamespaceSet, kind:uint = 0x09) {
			super(kind);
			initMultipleNamespaceName(name, namespaceSet);
		}

		protected function initMultipleNamespaceName(name:String, namespaceSet:NamespaceSet):void {
			Assert.notNull(name, "name argument must not be null");
			Assert.notNull(namespaceSet, "namespaceSet argument must not be null");
			_name = name;
			_namespaceSet = namespaceSet;
		}


		public function get name():String {
			return _name;
		}

		public function get namespaceSet():NamespaceSet {
			return _namespaceSet;
		}

		public override function equals(object:Object):Boolean {
			var mnsn:MultipleNamespaceName = object as MultipleNamespaceName;

			if (mnsn != null) {
				return mnsn.name == this.name && mnsn.namespaceSet.equals(this.namespaceSet);
			}

			return false;
		}

		public function toString():String {
			var nsString:String = namespaceSet.toString();
			var sepChar:String = (nsString.indexOf(SWFConstant.COLON) == -1) ? SWFConstant.COLON : SWFConstant.FORWARD_SLASH;

			return nsString.concat(sepChar, name);
		}
	}
}