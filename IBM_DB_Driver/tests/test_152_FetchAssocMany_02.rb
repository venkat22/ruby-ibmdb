# 
#  Licensed Materials - Property of IBM
#
#  (c) Copyright IBM Corp. 2007,2008,2009
#

class TestIbmDb < Test::Unit::TestCase

  def test_152_FetchAssocMany_02
    assert_expect do
      conn = IBM_DB::connect db,username,password

      server = IBM_DB::server_info( conn )
      if (server.DBMS_NAME[0,3] == 'IDS')
        op = {IBM_DB::ATTR_CASE => IBM_DB::CASE_UPPER}
        IBM_DB::set_option conn, op, 0
      end
      
      result = IBM_DB::exec conn, "select * from project"
      
      while (row = IBM_DB::fetch_assoc(result))
      printf("%6s ",row['PROJNO'])
      printf("%-24s ",row['PROJNAME'])
      printf("%3s ",row['DEPTNO'])
      printf("%6s",row['RESPEMP'])
      printf("%7s ",row['PRSTAFF'])
      printf("%10s ",row['PRSTDATE'])
      printf("%10s ",row['PRENDATE'])
      printf("%6s",row['MAJPROJ'])
      
      puts ""
      end
    end
  end

end

__END__
__LUW_EXPECTED__
AD3100 ADMIN SERVICES           D01 000010 0.65E1 1982-01-01 1983-02-01       
AD3110 GENERAL ADMIN SYSTEMS    D21 000070  0.6E1 1982-01-01 1983-02-01 AD3100
AD3111 PAYROLL PROGRAMMING      D21 000230  0.2E1 1982-01-01 1983-02-01 AD3110
AD3112 PERSONNEL PROGRAMMING    D21 000250  0.1E1 1982-01-01 1983-02-01 AD3110
AD3113 ACCOUNT PROGRAMMING      D21 000270  0.2E1 1982-01-01 1983-02-01 AD3110
IF1000 QUERY SERVICES           C01 000030  0.2E1 1982-01-01 1983-02-01       
IF2000 USER EDUCATION           C01 000030  0.1E1 1982-01-01 1983-02-01       
MA2100 WELD LINE AUTOMATION     D01 000010 0.12E2 1982-01-01 1983-02-01       
MA2110 W L PROGRAMMING          D11 000060  0.9E1 1982-01-01 1983-02-01 MA2100
MA2111 W L PROGRAM DESIGN       D11 000220  0.2E1 1982-01-01 1982-12-01 MA2110
MA2112 W L ROBOT DESIGN         D11 000150  0.3E1 1982-01-01 1982-12-01 MA2110
MA2113 W L PROD CONT PROGS      D11 000160  0.3E1 1982-02-15 1982-12-01 MA2110
OP1000 OPERATION SUPPORT        E01 000050  0.6E1 1982-01-01 1983-02-01       
OP1010 OPERATION                E11 000090  0.5E1 1982-01-01 1983-02-01 OP1000
OP2000 GEN SYSTEMS SERVICES     E01 000050  0.5E1 1982-01-01 1983-02-01       
OP2010 SYSTEMS SUPPORT          E21 000100  0.4E1 1982-01-01 1983-02-01 OP2000
OP2011 SCP SYSTEMS SUPPORT      E21 000320  0.1E1 1982-01-01 1983-02-01 OP2010
OP2012 APPLICATIONS SUPPORT     E21 000330  0.1E1 1982-01-01 1983-02-01 OP2010
OP2013 DB/DC SUPPORT            E21 000340  0.1E1 1982-01-01 1983-02-01 OP2010
PL2100 WELD LINE PLANNING       B01 000020  0.1E1 1982-01-01 1982-09-15 MA2100
__ZOS_EXPECTED__
AD3100 ADMIN SERVICES           D01 000010 0.65E1 1982-01-01 1983-02-01       
AD3110 GENERAL ADMIN SYSTEMS    D21 000070  0.6E1 1982-01-01 1983-02-01 AD3100
AD3111 PAYROLL PROGRAMMING      D21 000230  0.2E1 1982-01-01 1983-02-01 AD3110
AD3112 PERSONNEL PROGRAMMING    D21 000250  0.1E1 1982-01-01 1983-02-01 AD3110
AD3113 ACCOUNT PROGRAMMING      D21 000270  0.2E1 1982-01-01 1983-02-01 AD3110
IF1000 QUERY SERVICES           C01 000030  0.2E1 1982-01-01 1983-02-01       
IF2000 USER EDUCATION           C01 000030  0.1E1 1982-01-01 1983-02-01       
MA2100 WELD LINE AUTOMATION     D01 000010 0.12E2 1982-01-01 1983-02-01       
MA2110 W L PROGRAMMING          D11 000060  0.9E1 1982-01-01 1983-02-01 MA2100
MA2111 W L PROGRAM DESIGN       D11 000220  0.2E1 1982-01-01 1982-12-01 MA2110
MA2112 W L ROBOT DESIGN         D11 000150  0.3E1 1982-01-01 1982-12-01 MA2110
MA2113 W L PROD CONT PROGS      D11 000160  0.3E1 1982-02-15 1982-12-01 MA2110
OP1000 OPERATION SUPPORT        E01 000050  0.6E1 1982-01-01 1983-02-01       
OP1010 OPERATION                E11 000090  0.5E1 1982-01-01 1983-02-01 OP1000
OP2000 GEN SYSTEMS SERVICES     E01 000050  0.5E1 1982-01-01 1983-02-01       
OP2010 SYSTEMS SUPPORT          E21 000100  0.4E1 1982-01-01 1983-02-01 OP2000
OP2011 SCP SYSTEMS SUPPORT      E21 000320  0.1E1 1982-01-01 1983-02-01 OP2010
OP2012 APPLICATIONS SUPPORT     E21 000330  0.1E1 1982-01-01 1983-02-01 OP2010
OP2013 DB/DC SUPPORT            E21 000340  0.1E1 1982-01-01 1983-02-01 OP2010
PL2100 WELD LINE PLANNING       B01 000020  0.1E1 1982-01-01 1982-09-15 MA2100
__SYSTEMI_EXPECTED__
AD3100 ADMIN SERVICES           D01 000010 0.65E1 1982-01-01 1983-02-01       
AD3110 GENERAL ADMIN SYSTEMS    D21 000070  0.6E1 1982-01-01 1983-02-01 AD3100
AD3111 PAYROLL PROGRAMMING      D21 000230  0.2E1 1982-01-01 1983-02-01 AD3110
AD3112 PERSONNEL PROGRAMMING    D21 000250  0.1E1 1982-01-01 1983-02-01 AD3110
AD3113 ACCOUNT PROGRAMMING      D21 000270  0.2E1 1982-01-01 1983-02-01 AD3110
IF1000 QUERY SERVICES           C01 000030  0.2E1 1982-01-01 1983-02-01       
IF2000 USER EDUCATION           C01 000030  0.1E1 1982-01-01 1983-02-01       
MA2100 WELD LINE AUTOMATION     D01 000010 0.12E2 1982-01-01 1983-02-01       
MA2110 W L PROGRAMMING          D11 000060  0.9E1 1982-01-01 1983-02-01 MA2100
MA2111 W L PROGRAM DESIGN       D11 000220  0.2E1 1982-01-01 1982-12-01 MA2110
MA2112 W L ROBOT DESIGN         D11 000150  0.3E1 1982-01-01 1982-12-01 MA2110
MA2113 W L PROD CONT PROGS      D11 000160  0.3E1 1982-02-15 1982-12-01 MA2110
OP1000 OPERATION SUPPORT        E01 000050  0.6E1 1982-01-01 1983-02-01       
OP1010 OPERATION                E11 000090  0.5E1 1982-01-01 1983-02-01 OP1000
OP2000 GEN SYSTEMS SERVICES     E01 000050  0.5E1 1982-01-01 1983-02-01       
OP2010 SYSTEMS SUPPORT          E21 000100  0.4E1 1982-01-01 1983-02-01 OP2000
OP2011 SCP SYSTEMS SUPPORT      E21 000320  0.1E1 1982-01-01 1983-02-01 OP2010
OP2012 APPLICATIONS SUPPORT     E21 000330  0.1E1 1982-01-01 1983-02-01 OP2010
OP2013 DB/DC SUPPORT            E21 000340  0.1E1 1982-01-01 1983-02-01 OP2010
PL2100 WELD LINE PLANNING       B01 000020  0.1E1 1982-01-01 1982-09-15 MA2100
__IDS_EXPECTED__
AD3100 ADMIN SERVICES           D01 000010 0.65E1 1982-01-01 1983-02-01       
AD3110 GENERAL ADMIN SYSTEMS    D21 000070  0.6E1 1982-01-01 1983-02-01 AD3100
AD3111 PAYROLL PROGRAMMING      D21 000230  0.2E1 1982-01-01 1983-02-01 AD3110
AD3112 PERSONNEL PROGRAMMING    D21 000250  0.1E1 1982-01-01 1983-02-01 AD3110
AD3113 ACCOUNT PROGRAMMING      D21 000270  0.2E1 1982-01-01 1983-02-01 AD3110
IF1000 QUERY SERVICES           C01 000030  0.2E1 1982-01-01 1983-02-01       
IF2000 USER EDUCATION           C01 000030  0.1E1 1982-01-01 1983-02-01       
MA2100 WELD LINE AUTOMATION     D01 000010 0.12E2 1982-01-01 1983-02-01       
MA2110 W L PROGRAMMING          D11 000060  0.9E1 1982-01-01 1983-02-01 MA2100
MA2111 W L PROGRAM DESIGN       D11 000220  0.2E1 1982-01-01 1982-12-01 MA2110
MA2112 W L ROBOT DESIGN         D11 000150  0.3E1 1982-01-01 1982-12-01 MA2110
MA2113 W L PROD CONT PROGS      D11 000160  0.3E1 1982-02-15 1982-12-01 MA2110
OP1000 OPERATION SUPPORT        E01 000050  0.6E1 1982-01-01 1983-02-01       
OP1010 OPERATION                E11 000090  0.5E1 1982-01-01 1983-02-01 OP1000
OP2000 GEN SYSTEMS SERVICES     E01 000050  0.5E1 1982-01-01 1983-02-01       
OP2010 SYSTEMS SUPPORT          E21 000100  0.4E1 1982-01-01 1983-02-01 OP2000
OP2011 SCP SYSTEMS SUPPORT      E21 000320  0.1E1 1982-01-01 1983-02-01 OP2010
OP2012 APPLICATIONS SUPPORT     E21 000330  0.1E1 1982-01-01 1983-02-01 OP2010
OP2013 DB/DC SUPPORT            E21 000340  0.1E1 1982-01-01 1983-02-01 OP2010
PL2100 WELD LINE PLANNING       B01 000020  0.1E1 1982-01-01 1982-09-15 MA2100