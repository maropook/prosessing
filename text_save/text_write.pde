void textWrite( String fileName, String msg ){
   try {
    FileOutputStream fos = new FileOutputStream( fileName, true );
    fos.write( msg.getBytes() );
    fos.close();    
  } catch (Exception ex) {
    //例外
    ex.printStackTrace();
  }  
}
//こういうファイルに書き込むっていう決まった処理コピペした
