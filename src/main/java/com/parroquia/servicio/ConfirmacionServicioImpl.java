package com.parroquia.servicio;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Optional;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Confirmacion;
import com.parroquia.repositorio.ConfirmacionRepositorio;

@Service
public class ConfirmacionServicioImpl implements ConfirmacionServicio {

	@Autowired
	private ConfirmacionRepositorio repositorio;

	@Override
	public Confirmacion insertaActualizaConfirmacion(Confirmacion obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

	@Override
	public void eliminaConfirmacion(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Confirmacion> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<Confirmacion> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Confirmacion> buscarPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}

	@Override
	public ByteArrayInputStream exportAllDataConfirmacion() throws Exception {
		String[] columns= {"ID","Numero de Libro","Numero de Folio","Numero Partida","Apellidos","Nombre", "Madre","Padre","Lugar Confirmacion","Edad de confirmacion","Fecha de Confirmacion","Ministro Sacramento","Madrina","Padrino","Nombre Parroquia","Fecha de Bautismo"};
		Workbook workbook = new HSSFWorkbook();
		ByteArrayOutputStream stream=new ByteArrayOutputStream();
		
		Sheet sheet= workbook.createSheet("confirmaciones");
		Row row=sheet.createRow(0);
		for (int i = 0; i < columns.length; i++) {
			Cell cell=row.createCell(i);
			cell.setCellValue(columns[i]);
		}
		
		List<Confirmacion> confirmacion=this.listarTodos();
		int initRow=1;
		
		for (Confirmacion confirmacion2 : confirmacion) {
			row= sheet.createRow(initRow);
			row.createCell(0).setCellValue(confirmacion2.getIdconfirmacion());
			row.createCell(1).setCellValue(confirmacion2.getNumlibro());
			row.createCell(2).setCellValue(confirmacion2.getNumfolio());
			row.createCell(3).setCellValue(confirmacion2.getNumpartida());
			row.createCell(4).setCellValue(confirmacion2.getApellidos());
			row.createCell(5).setCellValue(confirmacion2.getNombres());
			row.createCell(6).setCellValue(confirmacion2.getMadre());
			row.createCell(7).setCellValue(confirmacion2.getPadre());
			row.createCell(8).setCellValue(confirmacion2.getLugarconfirmacion());
			row.createCell(9).setCellValue(confirmacion2.getEdadconfirmacion());
			row.createCell(10).setCellValue(confirmacion2.getFechaconfirmacion());
			row.createCell(11).setCellValue(confirmacion2.getMinistrosacramento());
			row.createCell(12).setCellValue(confirmacion2.getMadrina());
			row.createCell(13).setCellValue(confirmacion2.getPadrino());
			row.createCell(14).setCellValue(confirmacion2.getNomparroquia());
			row.createCell(15).setCellValue(confirmacion2.getFechabautismo());
			
			initRow++;
			
		}
		workbook.write(stream);
		workbook.close();
		
		
		return new ByteArrayInputStream(stream.toByteArray());
	}


}
